import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

PreferredSizeWidget actionsAppbar(
    {required String title, required List<Widget> actions}) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: true,
    actions: actions,
    backgroundColor: CustomColors.kLightBackground,
    leading: Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: CustomColors.kDarkBlue,
          )),
    ),
    elevation: 0,
    title: Text(
      title,
      style: CustomTextStyles.kBold20.copyWith(color: CustomColors.kDarkBlue),
    ),
  );
}
