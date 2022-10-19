import 'package:aimart_dev/app/data/helper/paymentstrip.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:aimart_dev/app/modules/home/bindings/home_binding.dart';
import 'package:aimart_dev/app/modules/home/views/splash/splash_screen.dart';
import 'package:aimart_dev/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/data/constants/theme.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = stripePublishableKey;
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
          home: SplashScreen()),
    );
  }
}
