import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/models/transaction_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/secondary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/profileWidgets/transaction_card.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyPaymentScreen extends StatelessWidget {
  const MyPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppbar(title: 'My Payment'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h),
          Text(
            'My Credit Card',
            style: CustomTextStyles.kBold20
                .copyWith(color: CustomColors.kDarkBblue),
          ),
          SizedBox(height: 28.h),
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
          SizedBox(height: 24.h),
          PrimaryButton(
              onPressed: () {},
              color: CustomColors.kWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add New Credit Card",
                    style: CustomTextStyles.kBold12
                        .copyWith(color: CustomColors.kGrey),
                  ),
                  SizedBox(width: 9.67.h),
                  SvgPicture.asset(CustomAssets.kadd)
                ],
              )),
          SizedBox(height: 24.h),
          Text(
            "History Transaction",
            style: CustomTextStyles.kBold20
                .copyWith(color: CustomColors.kDarkBblue),
          ),
          SizedBox(height: 28.h),
          ListView.separated(
              itemCount: dummyTransactions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  Divider(color: CustomColors.kDivider, height: 30.h),
              itemBuilder: (context, index) {
                return TransactionCard(
                  transactions: dummyTransactions[index],
                );
              })
        ],
      ),
    );
  }
}
