import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

class HeadingCard extends StatelessWidget {
  final String heading;
  const HeadingCard({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: Get.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      color: Color(0xffEFF3FA),
      child: Text(
        heading,
        style: CustomTextStyles.kMedium16.copyWith(color: CustomColors.kGrey2),
      ),
    );
  }
}
