import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/text_button.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payment Method",
                style: CustomTextStyles.kBold20
                    .copyWith(color: CustomColors.kDarkBblue)),
            CustomTextButton(onPressed: () {}, text: 'Edit')
          ],
        ),
        SizedBox(height: 24.h),
        ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 10,
          leading: Container(
            height: 24.h,
            width: 32.h,
            decoration: BoxDecoration(
                color: CustomColors.kDivider,
                borderRadius: BorderRadius.circular(5.r),
                image: DecorationImage(
                    image: AssetImage(CustomAssets.kmasterCard))),
          ),
          title: Text('Credit Card',
              style: CustomTextStyles.kMedium12
                  .copyWith(color: CustomColors.kDarkBblue)),
          trailing: Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: SvgPicture.asset(CustomAssets.karrowDown)),
        ),
        CreditCard(
            width: Get.width,
            height: 210.h,
            horizontalMargin: 0,
            cardNumber: "5450 7879 4864 7854",
            cardExpiry: "10/25",
            cardHolderName: "Card Holder",
            cvv: "456",
            bankName: "Axis Bank",
            cardType: CardType
                .masterCard, // Optional if you want to override Card Type
            showBackSide: false,
            frontBackground: CardBackgrounds.black,
            backBackground: CardBackgrounds.white,
            showShadow: false,
            textExpDate: 'Exp. Date',
            textName: 'Name',
            textExpiry: 'MM/YY'),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Address",
                style: CustomTextStyles.kBold20
                    .copyWith(color: CustomColors.kDarkBblue)),
            CustomTextButton(onPressed: () {}, text: 'Edit')
          ],
        ),
        Container(
          height: 133.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: CustomColors.kDivider),
              image: DecorationImage(
                  image: AssetImage(CustomAssets.kmap), fit: BoxFit.cover)),
        ),
        SizedBox(height: 10.h),
        Text(
          'Alex Christian / +62 8312 2342 475',
          style: CustomTextStyles.kMedium14.copyWith(color: CustomColors.kGrey),
        ),
        Text(
          'Jl. Gajah Mungkur Raya 02, Semarang City, 3021 Central Java, Indonesia.',
          style: CustomTextStyles.kMedium14.copyWith(color: CustomColors.kGrey),
        ),
        SizedBox(height: 20.h),
        Text("Order Details",
            style: CustomTextStyles.kBold20
                .copyWith(color: CustomColors.kDarkBblue)),
        SizedBox(height: 10.h),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              Divider(color: CustomColors.kDivider),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mambo Sport Premium',
                  style: CustomTextStyles.kBold12
                      .copyWith(color: CustomColors.kDarkBblue),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'T-Shirt . Blue Safir . L . Qty 1',
                      style: CustomTextStyles.kMedium14
                          .copyWith(color: CustomColors.kGrey),
                    ),
                    Text(
                      '\$19,99',
                      style: CustomTextStyles.kBold14
                          .copyWith(color: CustomColors.kPrimary),
                    )
                  ],
                )
              ],
            );
          },
        ),
        SizedBox(height: 20.h),
        Text("Payment Details",
            style: CustomTextStyles.kBold20
                .copyWith(color: CustomColors.kDarkBblue)),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sub Total",
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kGrey)),
            Text("\$135.98",
                style: CustomTextStyles.kBold14.copyWith(
                    color: CustomColors.kPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Delivery",
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kGrey)),
            Text("\$0",
                style: CustomTextStyles.kBold14.copyWith(
                    color: CustomColors.kPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount",
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kGrey)),
            Text("- \$0.98",
                style: CustomTextStyles.kBold14.copyWith(
                    color: CustomColors.kError, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Order",
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kGrey)),
            Text("\$135,00",
                style: CustomTextStyles.kBold14.copyWith(
                    color: CustomColors.kPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 20.h),
        Container(
          height: 90.h,
          color: CustomColors.kWhite,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Order",
                        style: CustomTextStyles.kBold12
                            .copyWith(color: CustomColors.kGrey)),
                    SizedBox(height: 10.h),
                    Text("\$135.00",
                        style: CustomTextStyles.kBold20
                            .copyWith(color: CustomColors.kPrimary)),
                  ],
                ),
              ),
              Expanded(
                child: PrimaryButton(
                    onPressed: () {},
                    child: Text(
                      "Payment",
                      style: CustomTextStyles.kBold16,
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
