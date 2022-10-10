// ignore_for_file: must_be_immutable

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  onBoardingModel onBoarding;
  final int index;

  OnboardingWidget({
    Key? key,
    required this.onBoarding,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          height: 456.h,
          decoration: BoxDecoration(
              borderRadius: index == 0
                  ? BorderRadius.only(bottomLeft: Radius.circular(80.r))
                  : index == 2
                      ? BorderRadius.only(bottomRight: Radius.circular(80.r))
                      : null,
              image: DecorationImage(
                  image: AssetImage(onBoarding.image), fit: BoxFit.cover)),
        ),
        SizedBox(height: 64.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                onBoarding.title,
                style: CustomTextStyles.kBold28,
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(right: 35.w),
                child: Text(
                  onBoarding.subTitle,
                  style: CustomTextStyles.kMedium16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
