import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onBoarding/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
      nextScreen: const OnBoardScreen(),
    );
  }
}
