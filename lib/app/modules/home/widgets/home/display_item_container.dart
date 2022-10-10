import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

import '../../models/product_model.dart';
import '../../models/tag_model.dart';
import '../wishlist/favourite_icon.dart';

class DisplayItemContainer extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;
  final Color isLike;
  const DisplayItemContainer({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.isLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 426.h,
        width: 319.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: AssetImage(product.productImage!),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(children: [
              Row(children: [
                Container(
                  height: 33.h,
                  decoration: BoxDecoration(
                    color: product.productTag!.tagType == Tagtype.trending
                        ? CustomColors.kTrendingBlue
                        : product.productTag!.tagType == Tagtype.discount
                            ? CustomColors.kdarkred
                            : product.productTag!.tagType == Tagtype.bestseller
                                ? CustomColors.kgreen
                                : CustomColors.knewblue,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 2.h),
                      child: Text(
                        product.productTag!.tagName,
                        style: CustomTextStyles.kBold14
                            .copyWith(color: CustomColors.kWhite),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                FavouriteButton(
                  onPressed: onPressed,
                  isFavourite: isLike,
                ),
              ]),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName!,
                    style: CustomTextStyles.kBold20
                        .copyWith(color: CustomColors.kWhite),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text(
                        product.productType!,
                        style: CustomTextStyles.kMedium14
                            .copyWith(color: CustomColors.kWhite),
                      ),
                      const Spacer(),
                      Text(
                        '\$${product.productPrize!}',
                        style: CustomTextStyles.kBold20
                            .copyWith(color: CustomColors.kWhite),
                      ),
                    ],
                  )
                ],
              )
            ])));
  }
}
