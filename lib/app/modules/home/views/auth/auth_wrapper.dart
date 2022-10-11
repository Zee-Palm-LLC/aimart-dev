import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../landingScreen/landing_screen.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
        init: AuthController(),
        autoRemove: false,
        builder: (ac) {
          if (ac.user == null) {
            return LoginScreen();
          } else {
            Get.put(UserController());
            return LandingPage();
          }
        });
  }
}
