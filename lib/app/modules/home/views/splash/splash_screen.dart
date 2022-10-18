import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/views/auth/auth_wrapper.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:is_first_run/is_first_run.dart';

import '../onBoarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkFirstRun();
    super.initState();
  }

  bool _isFirstRun = true;

  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 700.sp,
      centered: true,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            CustomAssets.kLogo,
          ),
          Text(
            'AIMART',
            style: CustomTextStyles.kBold40,
          )
        ],
      ),
      nextScreen: _isFirstRun ? const OnBoardScreen() : const AuthWrapper(),
    );
  }
}
