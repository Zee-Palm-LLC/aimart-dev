import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String text;

  const CustomListTile(
      {Key? key, required this.onTap, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 10.w,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
        ],
      ),
      title: Text(text,
          style: CustomTextStyles.kBold16
              .copyWith(color: CustomColors.kDarkBblue)),
      trailing: SvgPicture.asset(CustomAssets.karrowForward),
    );
  }
}
