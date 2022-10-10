


import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartNotificationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isNotification;
  const CartNotificationButton({
    Key? key,
    required this.onPressed,
    required this.isNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onPressed,
              child: SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(CustomAssets.kcartinactive)),
            ),
          ],
        ),
        Positioned(
            top: 14,
            right: 0,
            child: isNotification?   Container(
              height: 12.h,
              width: 12.w,
              //padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: CustomColors.kError),
              alignment: Alignment.center,
            ): const SizedBox()
            ),
      ],
    );
  }
}
