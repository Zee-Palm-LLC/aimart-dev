import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class listGridButton extends StatelessWidget {
  final bool isView;
  final VoidCallback onGridPress;
  final VoidCallback onListPress;
  const listGridButton({
    Key? key,
    required this.isView,
    required this.onGridPress,
    required this.onListPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: 68.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: CustomColors.kprimary200)),
      child: Row(children: [
        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
            color: isView ?  Colors.transparent : CustomColors.kbrandblue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(CustomAssets.kgrid,
            color:  isView ?CustomColors.kGrey : CustomColors.kWhite, 
            ),
            onPressed: onGridPress,
          ),
        ),
        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
            color: isView ?  CustomColors.kbrandblue:Colors.transparent ,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(CustomAssets.klist,
            color: isView ? CustomColors.kWhite :CustomColors.kGrey
            ),
            onPressed: onListPress,
          ),
        )
      ]),
    );
  }
}