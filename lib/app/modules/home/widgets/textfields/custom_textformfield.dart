import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordField;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  CustomTextFormField({
    Key? key,
    this.focusNode,
    this.inputFormatter,
    required this.controller,
    required this.isPasswordField,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    required this.validator,
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
      controller: widget.controller,
      validator: widget.validator,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatter,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPasswordField ? show : false,
      keyboardType: widget.keyboardType,
      style: CustomTextStyles.kMedium12,
      decoration: InputDecoration(
        filled: true,
        errorStyle: CustomTextStyles.kMedium12
            .copyWith(color: CustomColors.kError, height: 0.5),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: SvgPicture.asset(
                    show ? CustomAssets.kOnEye : CustomAssets.kOffEye))
            : const SizedBox(),
        hintText: widget.hintText,
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

enum TextFormFieldStatus { error, success, normal }
