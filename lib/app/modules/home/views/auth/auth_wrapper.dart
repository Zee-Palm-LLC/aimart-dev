import 'package:aimart_dev/app/modules/home/views/auth/login_screen.dart';
import 'package:aimart_dev/app/modules/home/views/home/home_screen.dart';
import 'package:aimart_dev/app/modules/home/views/landingScreen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({Key? key}) : super(key: key);
  AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user == null) {
        return LoginScreen();
      }
      return LandingPage();
    });
  }
}
