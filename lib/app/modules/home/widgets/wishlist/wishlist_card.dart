import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';
import '../../../../data/helper/product_category.dart';
import '../../models/product_model.dart';
import 'favourite_icon.dart';

class WishListCard extends StatelessWidget {
  final Product product;

  final VoidCallback onPressed;
  final Color isFavourite;
  const WishListCard({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.isFavourite,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: 319.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(product.productImage!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 20.h),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 240.w,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: product.productTag!.tagType == Tagtype.trending
                        ? CustomColors.kPrimary
                        : product.productTag!.tagType == Tagtype.discount
                            ? CustomColors.kError
                            : product.productTag!.tagType == Tagtype.bestseller
                                ? CustomColors.kGreen
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
                Spacer(),
                FavouriteButton(
                  onPressed: onPressed,
                  isFavourite: isFavourite,
                ),
              ]),
            ),
            SizedBox(height: 11.h),
            Text(
              product.productName!,
              style: CustomTextStyles.kBold12
                  .copyWith(color: CustomColors.kPrimary),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$${product.productPrize!}',
                  style: CustomTextStyles.kBold14
                      .copyWith(color: CustomColors.kPrimary),
                ),
                SizedBox(width: 8.w),
                Text(
                  '\$${product.productPrize!}',
                  style: CustomTextStyles.kMedium14.copyWith(
                    color: CustomColors.kGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ]),
        ]));
  }
}
