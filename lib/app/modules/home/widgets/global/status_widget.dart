import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusWidget extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  const StatusWidget(
      {Key? key,
      required this.bgColor,
      required this.textColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        text,
        style: CustomTextStyles.kBold16.copyWith(color: textColor),
      ),
    );
  }
}
