import 'package:aimart_dev/app/modules/home/controllers/cart_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/page_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesController>(() => PagesController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}
