import 'package:aimart_dev/app/modules/home/controllers/page_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesController>(() => PagesController());
  }
}
