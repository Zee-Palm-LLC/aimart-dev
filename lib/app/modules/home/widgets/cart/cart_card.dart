import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/constants.dart';

class CartCard extends StatelessWidget {
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;
  final String text;
  const CartCard(
      {Key? key,
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
                    image: AssetImage(CustomAssets.kproduct1),
                    fit: BoxFit.cover)),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 26.h,
                  width: 26.w,
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: CustomColors.kWhite),
                  child: SvgPicture.asset(CustomAssets.kdone),
                )),
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
                      'Mambo Sport Premium',
                      style: CustomTextStyles.kBold14
                          .copyWith(color: CustomColors.kDarkBblue),
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
                Text('T-Shirt',
                    style: CustomTextStyles.kBold12
                        .copyWith(color: CustomColors.kGrey)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$89,99',
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
