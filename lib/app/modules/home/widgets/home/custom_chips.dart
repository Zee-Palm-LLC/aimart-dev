
import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomChips extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;
  const CustomChips({
    Key? key,
    required this.borderColor,
    required this.textColor,
    required this.color,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: CustomTextStyles.kMedium12.copyWith(
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}