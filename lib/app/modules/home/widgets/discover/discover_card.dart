import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';
import '../../../../data/helper/product_category.dart';

class DiscoverCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? favouriteCallback;
  final Color isFavourite;
  final Product product;
  const DiscoverCard({
    Key? key,
    this.onTap,
    required this.product,
    this.favouriteCallback,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: 170.h,
          width: 170.w,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                  image: NetworkImage(product.productImages.first),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 33.h,
                decoration: BoxDecoration(
                  color: product.productTag == Tagtype.trending
                      ? CustomColors.kTrendingBlue
                      : product.productTag == Tagtype.discount
                          ? CustomColors.kdarkred
                          : product.productTag == Tagtype.bestseller
                              ? CustomColors.kgreen
                              : CustomColors.knewblue,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 2.h),
                    child: Text(
                      product.productTag.name.toUpperCase(),
                      style: CustomTextStyles.kBold14
                          .copyWith(color: CustomColors.kWhite),
                    ),
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
        product.productName,
        style: CustomTextStyles.kMedium12
            .copyWith(color: CustomColors.kDarkTextColor),
      ),
      SizedBox(height: 4.h),
      Text(
        ' \$ ${product.productPrice}',
        style: CustomTextStyles.kBold14
            .copyWith(color: CustomColors.kDiscountTextColor),
      )
    ]);
  }
}
