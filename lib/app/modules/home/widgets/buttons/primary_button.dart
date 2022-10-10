import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.color = const Color(0xff4078E0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width, 50.h),
            primary: color,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            )),
        onPressed: onPressed,
        child: child);
  }
}
