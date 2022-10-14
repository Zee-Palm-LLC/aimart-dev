import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseAuth user = FirebaseAuth.instance;
  RxDouble totalCartPrice = 0.0.obs;

  Future<void> addtoCart({required CartItemModel cart}) async {
    try {
      await db.cartCollection.doc(user.currentUser!.uid).set(cart.toMap());
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
