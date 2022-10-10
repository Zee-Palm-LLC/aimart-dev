import 'package:aimart_dev/app/modules/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';

class CustomDiscountWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? favouriteCallback;
  final Color isFavourite;
  const CustomDiscountWidget({
    Key? key,
    this.onTap,
    this.favouriteCallback,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () {},
        child: Container(
          height: 170.h,
          width: 170.w,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                  image: AssetImage(CustomAssets.kproduct1),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.w,
                height: 28.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: CustomColors.kPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'New',
                    style: CustomTextStyles.kBold12
                        .copyWith(color: CustomColors.kWhite),
                  ),
                ),
              ),
              FavouriteButton(onPressed: () {}, isFavourite: isFavourite)
            ],
          ),
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        'Vineyard Style',
        style: CustomTextStyles.kMedium12
            .copyWith(color: CustomColors.kDarkTextColor),
      ),
      SizedBox(height: 4.h),
      Text(
        ' \$57,99',
        style: CustomTextStyles.kBold14
            .copyWith(color: CustomColors.kDiscountTextColor),
      )
    ]);
  }
}
