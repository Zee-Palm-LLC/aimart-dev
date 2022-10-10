import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../controllers/page_controller.dart';
import '../../widgets/textfields/custom_textFormField.dart';

class ShippingAddress extends StatelessWidget {
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _city = TextEditingController();
  final _region = TextEditingController();
  final _postalCode = TextEditingController();
  final _country = TextEditingController();

  PagesController pc = Get.find<PagesController>();
  ShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 28.w), children: [
      SizedBox(height: 32.h),
      Text("Shipping Address",
          style: CustomTextStyles.kBold20
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 24.h),
      Text('Full Name',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _fullName,
          isPasswordField: false,
          hintText: 'Full Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Phone Number',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _phone,
          isPasswordField: false,
          hintText: '0123456789',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('City',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _city,
          isPasswordField: false,
          hintText: 'City Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Region',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _region,
          isPasswordField: false,
          hintText: 'Region Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Postal Code',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _postalCode,
          isPasswordField: false,
          hintText: 'Enter your postal code',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Country',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _country,
          isPasswordField: false,
          hintText: 'Enter your country',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Location Details',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      Container(
        height: 133.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: CustomColors.kDivider),
            image: DecorationImage(
                image: AssetImage(CustomAssets.kmap), fit: BoxFit.cover)),
      ),
      SizedBox(height: 30.h),
      PrimaryButton(
          onPressed: () {
            0.3
                .seconds
                .delay()
                .then((value) async => await pc.animateInitialPageToNext());
          },
          child: Text(
            "Confirm and Continue",
            style: CustomTextStyles.kBold16,
          ))
    ]);
  }
}