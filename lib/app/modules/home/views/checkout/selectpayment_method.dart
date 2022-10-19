import 'package:aimart_dev/app/data/helper/checkout_enum.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/checkout/payment_listtile.dart';
import 'package:aimart_dev/app/modules/home/widgets/textfields/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../controllers/page_controller.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  Checkout checkout = Checkout.selectPaymentmethod;
  int value = 0;

  PagesController pc = Get.find<PagesController>();
  final _name = TextEditingController();
  final _cardNumber = TextEditingController();
  final _expiredDate = TextEditingController();
  final _securityCode = TextEditingController();
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return checkout == Checkout.selectPaymentmethod
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Text("Payment Method",
                    style: CustomTextStyles.kBold20
                        .copyWith(color: CustomColors.kDarkBlue)),
                SizedBox(height: 24.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PaymentMethodsRadioListTile(
                      value: index,
                      payment: paymentMethodList[index],
                      groupValue: value,
                      onChanged: (int? index) {
                        setState(() {
                          value = index!;
                        });
                      },
                    );
                  },
                  itemCount: paymentMethodList.length,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 10,
                  leading: Container(
                      height: 24.h,
                      width: 32.h,
                      decoration: BoxDecoration(
                        color: CustomColors.kDivider,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: const Icon(Icons.more_horiz)),
                  title: Text('View more methods',
                      style: CustomTextStyles.kMedium12
                          .copyWith(color: CustomColors.kDarkBlue)),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.h),
                    child: SvgPicture.asset(CustomAssets.karrowForward),
                  ),
                ),
                SizedBox(height: 300.h),
                PrimaryButton(
                    onPressed: () {
                      setState(() {
                        checkout = Checkout.cardMethod;
                        print(checkout);
                      });
                    },
                    child: Text("Submit", style: CustomTextStyles.kBold16))
              ],
            ),
          )
        : checkout == Checkout.cardMethod
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    Text("Payment Method",
                        style: CustomTextStyles.kBold20
                            .copyWith(color: CustomColors.kDarkBlue)),
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
                              .copyWith(color: CustomColors.kDarkBlue)),
                      trailing: Padding(
                          padding: EdgeInsets.only(right: 12.h),
                          child: SvgPicture.asset(CustomAssets.karrowDown)),
                    ),
                    SizedBox(height: 20.h),
                    Text('Name on card',
                        style: CustomTextStyles.kBold14
                            .copyWith(color: CustomColors.kDarkBlue)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                        controller: _name,
                        isPasswordField: false,
                        hintText: 'Name on Card',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (val) {}),
                    SizedBox(height: 20.h),
                    Text('Card Number',
                        style: CustomTextStyles.kBold14
                            .copyWith(color: CustomColors.kDarkBlue)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                        controller: _cardNumber,
                        isPasswordField: false,
                        hintText: 'Name on Card',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (val) {}),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Expired Date ',
                                  style: CustomTextStyles.kBold14
                                      .copyWith(color: CustomColors.kDarkBlue)),
                              SizedBox(height: 10.h),
                              CustomTextFormField(
                                  controller: _expiredDate,
                                  isPasswordField: false,
                                  hintText: 'MM/YY',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.datetime,
                                  validator: (val) {}),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Security code',
                                  style: CustomTextStyles.kBold14
                                      .copyWith(color: CustomColors.kDarkBlue)),
                              SizedBox(height: 10.h),
                              CustomTextFormField(
                                  controller: _securityCode,
                                  isPasswordField: false,
                                  hintText: 'CVC',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  validator: (val) {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: CustomColors.kPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              value: agreeTerms,
                              onChanged: (val) {
                                setState(() {
                                  agreeTerms = val!;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'My billing address is the  same  as my  shipping  address.',
                              style: CustomTextStyles.kBold12
                                  .copyWith(color: CustomColors.kDarkBlue),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
                    PrimaryButton(
                        onPressed: () {
                          0.3.seconds.delay().then((value) async =>
                              await pc.animateInitialPageToNext());
                        },
                        child: Text("Confirm and Continue",
                            style: CustomTextStyles.kBold16))
                  ],
                ),
              )
            : SizedBox();
  }
}

class PaymentMethods {
  String image;
  String paymentName;
  PaymentMethods({required this.image, required this.paymentName});
}

List<PaymentMethods> paymentMethodList = [
  PaymentMethods(image: CustomAssets.kmasterCard, paymentName: 'Credit Card'),
  PaymentMethods(image: CustomAssets.kapplePay, paymentName: 'Apple Pay'),
  PaymentMethods(
      image: CustomAssets.kcashDelivery, paymentName: 'Cash on Delivery'),
];
