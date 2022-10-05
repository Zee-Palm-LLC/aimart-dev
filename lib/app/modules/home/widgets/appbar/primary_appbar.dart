import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

PreferredSizeWidget primaryAppbar({required String title}) {
  return AppBar(
    elevation: 0,
    title: Text(
      title,
      style: CustomTextStyles.kBold20.copyWith(color: CustomColors.kBlack),
    ),
  );
}
