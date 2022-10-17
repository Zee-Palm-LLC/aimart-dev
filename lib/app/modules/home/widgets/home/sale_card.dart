import 'package:aimart_dev/app/data/helper/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

import '../../models/product_model.dart';
import '../wishlist/favourite_icon.dart';

class ProductSaleCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback favoriteCallBack;
  final Color isFavourite;

  const ProductSaleCard({
    Key? key,
    required this.onTap,
    required this.product,
    required this.favoriteCallBack,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
          height: 100.h,
          width: 319.w,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(product.productImages.first),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 20.h),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 240.w,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: product.productTag == Tagtype.trending
                              ? CustomColors.kTrendingBlue
                              : product.productTag == Tagtype.discount
                                  ? CustomColors.kdarkred
                                  : product.productTag == Tagtype.bestseller
                                      ? CustomColors.kgreen
                                      : CustomColors.knewblue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 2.h),
                            child: Text(
                              product.productTag.name,
                              style: CustomTextStyles.kBold12
                                  .copyWith(color: CustomColors.kWhite),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      FavouriteButton(
                        onPressed: favoriteCallBack,
                        isFavourite: isFavourite,
                      ),
                    ]),
              ),
              SizedBox(height: 11.h),
              Text(
                product.productName,
                style: CustomTextStyles.kBold12
                    .copyWith(color: CustomColors.kprimarylight),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${product.productType}',
                    style: CustomTextStyles.kBold14
                        .copyWith(color: CustomColors.kbrandblue),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '\$${product.productPrice}',
                    style: CustomTextStyles.kMedium14.copyWith(
                      color: CustomColors.kGrey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ]),
          ])),
    );
  }
}
