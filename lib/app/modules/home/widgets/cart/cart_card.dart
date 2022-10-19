import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';

class CartCard extends StatelessWidget {
  final CartItemModel cartItemModel;
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;
  final String text;
  const CartCard(
      {Key? key,
      required this.cartItemModel,
      required this.incrementCallback,
      required this.decrementCallback,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: NetworkImage(cartItemModel.product.productImages[0]),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItemModel.product.productName,
                      style: CustomTextStyles.kBold14
                          .copyWith(color: CustomColors.kDarkBlue),
                    ),
                    IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: CustomColors.kGrey,
                        ))
                  ],
                ),
                Text(cartItemModel.product.productType,
                    style: CustomTextStyles.kBold12
                        .copyWith(color: CustomColors.kGrey)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cartItemModel.product.productPrice}',
                      style: CustomTextStyles.kBold14
                          .copyWith(color: CustomColors.kPrimary),
                    ),
                    const Spacer(),
                    Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: CustomColors.kDivider)),
                        child: Center(
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: decrementCallback,
                              icon: Icon(
                                Icons.remove,
                                color: CustomColors.kGrey2,
                              )),
                        )),
                    SizedBox(width: 10.w),
                    Text(
                      text,
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kPrimary),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: CustomColors.kPrimary,
                            border: Border.all(color: CustomColors.kDivider)),
                        child: Center(
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: incrementCallback,
                              icon: Icon(
                                Icons.add,
                                color: CustomColors.kWhite,
                              )),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
