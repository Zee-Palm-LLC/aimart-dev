import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/views/cart/cart_screen.dart';
import 'package:aimart_dev/app/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseAuth user = FirebaseAuth.instance;
  RxDouble totalCartPrice = 0.0.obs;
  

  Future<void> addtoCart({required CartModel cart}) async {
    try {
      await db.cartCollection.doc(user.currentUser!.uid).set(cart.toMap());
      Get.to(() => CartScreen());
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

    Stream<CartModel> currentcartStream() {
    return db.cartCollection
        .doc(user.currentUser!.uid)
        .snapshots()
        .map((event) =>  CartModel.fromMap(event.data() as Map<String, dynamic>));
  }

  
 
}
