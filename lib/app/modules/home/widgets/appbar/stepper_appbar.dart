import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/page_controller.dart';

PreferredSizeWidget customAppBarStepper() {
  var statusController = Get.find<PagesController>();
  return AppBar(
    leading: IconButton(
        onPressed: () async {
          statusController.updateStatus(
              statusController.initialPageIndex, false);

          await statusController.animateInitialPageToPrevious();
        },
        icon: SvgPicture.asset(CustomAssets.karrowbackAndroid)),
    centerTitle: true,
    elevation: 0,
    backgroundColor: CustomColors.kLightBackground,
    title: Text('Checkout',
        style:
            CustomTextStyles.kBold20.copyWith(color: CustomColors.kDarkBblue)),
  );
}
