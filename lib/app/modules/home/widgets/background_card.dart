import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/constants.dart';

class BackGroundCard extends StatelessWidget {
  final Widget child;
  const BackGroundCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(CustomAssets.kLightLogo),
                alignment: Alignment.topCenter)),
        child: child);
  }
}
