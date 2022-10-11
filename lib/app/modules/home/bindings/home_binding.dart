import 'package:aimart_dev/app/modules/home/controllers/page_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesController>(() => PagesController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
