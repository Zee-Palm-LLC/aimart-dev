// ignore_for_file: must_be_immutable

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  OnBoarding onBoarding;

  OnboardingWidget({
    Key? key,
    required this.onBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(onBoarding.image),
        Padding(
          padding: EdgeInsets.only(top: 64.h, left: 28.w, right: 28.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                onBoarding.title,
                style: CustomTextStyles.kBold28,
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 35.w),
                child: Text(
                  onBoarding.subTitle,
                  style: CustomTextStyles.kMedium16,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
