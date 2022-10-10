import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color isFavourite;
  const FavouriteButton({
    Key? key,
    required this.onPressed,
    required this.isFavourite,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 36.w,
      decoration: BoxDecoration(
        color: isFavourite,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: SvgPicture.asset(CustomAssets.kFavourite),
        onPressed: onPressed,
      ),
    );
  }
}
