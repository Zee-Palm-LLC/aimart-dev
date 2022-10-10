import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

PreferredSizeWidget secondaryAppbar({required String title}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: CustomColors.kLightBackground,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(CustomAssets.karrowbackAndroid)),
    title: Text(
      title,
      style: CustomTextStyles.kBold20.copyWith(color: CustomColors.kDarkBblue),
    ),
  );
}
