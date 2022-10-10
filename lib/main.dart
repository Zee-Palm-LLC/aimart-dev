import 'package:aimart_dev/app/modules/home/bindings/home_binding.dart';
import 'package:aimart_dev/app/modules/home/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/data/constants/theme.dart';
import 'app/modules/home/views/landingScreen/landing_screen.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Aimart',
        theme: mainTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        initialBinding: HomeBinding(),
        home: const SplashScreen(),
      ),
    );
  }
}
