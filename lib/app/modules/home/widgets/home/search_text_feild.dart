import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../data/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final bool isEnabled;
  CustomTextFormField({
    Key? key,
    this.isEnabled = true,
    this.inputFormatter,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onChange,
  }) : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

bool show = true;

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      inputFormatters: widget.inputFormatter,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: CustomTextStyles.kMedium12,
      decoration: InputDecoration(
        errorStyle: CustomTextStyles.kMedium12
            .copyWith(color: CustomColors.kError, height: 0.5),
        prefixIcon: Padding(
          padding:
              EdgeInsets.only(left: 25.w, right: 26.w, top: 17.h, bottom: 17.h),
          child: SvgPicture.asset(
            CustomAssets.ksearch,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: CustomTextStyles.kMedium12,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kGrey.withOpacity(0.2))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kGrey)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: CustomColors.kGrey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: CustomColors.kGrey,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: CustomColors.kGrey,
            )),
        fillColor: CustomColors.kWhite,
      ),
    );
  }
}

enum TextFormFieldStatus { error, success, normal }
