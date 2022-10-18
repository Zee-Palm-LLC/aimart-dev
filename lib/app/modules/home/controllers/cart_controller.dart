import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/views/cart/cart_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/dialogs/dialogs.dart';
import 'package:aimart_dev/app/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseAuth user = FirebaseAuth.instance;
  Rx<List<CartModel>?> products = Rx<List<CartModel>?>(null);
  List<CartModel>? get allproductList => products.value;

  Future<void> addtoCart({required CartItemModel item}) async {
    //camelcase ka khyal kyya kro addto ni addTo "hr 2nd word ka first letter capital"
    showLoadingDialog(message: 'Adding to Cart');
    try {
      var cartDoc = await db.cartCollection.doc(user.currentUser!.uid).get();
      CartModel? cart;
      if (cartDoc.exists) {
        cart = CartModel.fromMap(cartDoc.data() as Map<String, dynamic>);
        cart.cartItemModel.add(item);
        await db.cartCollection.doc(user.currentUser!.uid).update(cart.toMap());
      } else {
        cart = CartModel(cartItemModel: [item]);
        await db.cartCollection.doc(user.currentUser!.uid).set(cart.toMap());
      }
      hideLoadingDialog();
      Get.to(() => CartScreen());
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar('Error', e.toString());
    }
  }

  Stream<CartModel> currentCartStream() {
    return db.cartCollection.doc(user.currentUser!.uid).snapshots().map(
        (event) => CartModel.fromMap(event.data() as Map<String, dynamic>));
  }

  Future<void> increaseCartItemQuantity(String productId) async {
    try {
      var cartDoc = await db.cartCollection.doc(user.currentUser!.uid).get();
      CartModel cart =
          CartModel.fromMap(cartDoc.data() as Map<String, dynamic>);
      cart.cartItemModel
          .firstWhere((element) => element.product.productId == productId)
          .quantity++;
      await db.cartCollection.doc(user.currentUser!.uid).update(cart.toMap());
      //try kro
    } on Exception catch (err) {
      print(err);
    }
  }

  Future<void> decreaseCartItemQuantity(String productId) async {
    try {
      var cartDoc = await db.cartCollection.doc(user.currentUser!.uid).get();
      CartModel cart =
          CartModel.fromMap(cartDoc.data() as Map<String, dynamic>);
      cart.cartItemModel
          .firstWhere((element) => element.product.productId == productId)
          .quantity--;
      await db.cartCollection.doc(user.currentUser!.uid).update(cart.toMap());
      //try kro
    } on Exception catch (err) {
      print(err);
    }
  }
}
