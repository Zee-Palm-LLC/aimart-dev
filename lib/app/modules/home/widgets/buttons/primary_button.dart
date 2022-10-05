import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const PrimaryButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width, 50.h),
            primary: CustomColors.kPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            )),
        onPressed: () {},
        child: child);
  }
}
