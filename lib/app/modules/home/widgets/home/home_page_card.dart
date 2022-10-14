import 'package:aimart_dev/app/data/helper/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../wishlist/favourite_icon.dart';

class HomePageCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onPressed;
  final VoidCallback favoriteCallback;
  final Color isLike;
  const HomePageCard({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.favoriteCallback,
    required this.isLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 426.h,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: NetworkImage(product.productImages.first),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(children: [
                Row(children: [
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
                      borderRadius: BorderRadius.circular(20.r),
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
                  const Spacer(),
                  FavouriteButton(
                    onPressed: favoriteCallback,
                    isFavourite: isLike,
                  ),
                ]),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: CustomTextStyles.kBold20
                          .copyWith(color: CustomColors.kWhite),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          product.productType,
                          style: CustomTextStyles.kMedium14
                              .copyWith(color: CustomColors.kWhite),
                        ),
                        const Spacer(),
                        Text(
                          '\$${product.productPrice.toDouble()}',
                          style: CustomTextStyles.kBold20
                              .copyWith(color: CustomColors.kWhite),
                        ),
                      ],
                    )
                  ],
                )
              ]))),
    );
  }
}
