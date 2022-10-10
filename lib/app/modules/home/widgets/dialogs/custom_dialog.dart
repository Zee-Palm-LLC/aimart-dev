import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/color.dart';
import '../../../../data/constants/typograpghy.dart';

class CustomDialogBox extends StatelessWidget {
  final String heading, description, svgIcon;

  const CustomDialogBox(
      {super.key,
      required this.heading,
      required this.description,
      required this.svgIcon});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 168.h,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            SizedBox(
              height: 28.h,
            ),
            SvgPicture.asset(svgIcon),
            SizedBox(
              height: 20.h,
            ),
            Text(
              heading,
              style: CustomTextStyles.kMedium16.copyWith(
                  color: CustomColors.kPopupTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: CustomTextStyles.kMedium12.copyWith(
                  color: CustomColors.kGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
