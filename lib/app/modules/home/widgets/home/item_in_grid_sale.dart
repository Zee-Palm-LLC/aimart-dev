import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

import '../../../../data/helper/product_category.dart';
import '../../models/product_model.dart';
import '../wishlist/favourite_icon.dart';

class ItemInGridSale extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;
  final Color isFavourite;
  const ItemInGridSale({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 214.h,
        width: 149.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: 149.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(product.productImage!),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: product.productTag!.tagType == Tagtype.trending
                              ? CustomColors.kTrendingBlue
                              : product.productTag!.tagType == Tagtype.discount
                                  ? CustomColors.kdarkred
                                  : product.productTag!.tagType ==
                                          Tagtype.bestseller
                                      ? CustomColors.kgreen
                                      : CustomColors.knewblue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 2.h),
                            child: Text(
                              product.productTag!.tagName,
                              style: CustomTextStyles.kBold12
                                  .copyWith(color: CustomColors.kWhite),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      FavouriteButton(
                        onPressed: onPressed,
                        isFavourite: isFavourite,
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              product.productName!,
              style: CustomTextStyles.kBold12
                  .copyWith(color: CustomColors.kprimarylight),
            ),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$${product.productPrize!}',
                  style: CustomTextStyles.kBold14
                      .copyWith(color: CustomColors.kbrandblue),
                ),
                SizedBox(width: 8.w),
                Text(
                  '\$${product.oldPrize!}',
                  style: CustomTextStyles.kMedium14.copyWith(
                    color: CustomColors.kGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
