import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChange;
  const SearchBar(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      style: CustomTextStyles.kMedium12,
      decoration: InputDecoration(
        filled: true,
        errorStyle: CustomTextStyles.kMedium12
            .copyWith(color: CustomColors.kError, height: 0.5),
        prefixIcon: Padding(
          padding: EdgeInsets.all(16.h),
          child: SvgPicture.asset(CustomAssets.ksearch),
        ),
        hintText: hintText,
        hintStyle: CustomTextStyles.kMedium12,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
                BorderSide(color: CustomColors.kGrey2.withOpacity(0.2))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kGrey2)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kGrey2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kPrimary, width: 1.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kPrimary, width: 1.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kError, width: 1.5)),
        fillColor: CustomColors.kLightBackground,
      ),
    );
  }
}
