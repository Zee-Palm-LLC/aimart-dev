import 'package:aimart_dev/app/data/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/color.dart';
import '../../../../data/constants/typograpghy.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/textfields/custom_textFormField.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 175.w,
            ),
            child: SvgPicture.asset(CustomAssets.kLightLogo),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 66.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create New Password',
                  style: CustomTextStyles.kBold20.copyWith(
                    fontSize: 24,
                    color: CustomColors.kDarkTextColor,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 100.w),
                  child: Text(
                    'Enter your email account to reset your password',
                    style: CustomTextStyles.kMedium14
                        .copyWith(color: CustomColors.kGrey, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33.h),
                  child: SizedBox(
                    width: 340.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Password',
                          style: CustomTextStyles.kMedium16.copyWith(
                            fontSize: 16.sp,
                            color: CustomColors.kDarkTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomTextFormField(
                          controller: newPasswordcontroller,
                          isPasswordField: true,
                          hintText: 'Enter your username..',
                          textInputAction: TextInputAction.none,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || value == "") {
                              return "This field can't be empty";
                            }

                            return null;
                          },
                          onChange: (v) {},
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Confirm Password',
                          style: CustomTextStyles.kMedium16.copyWith(
                            fontSize: 16,
                            color: CustomColors.kDarkTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordcontroller,
                          isPasswordField: true,
                          hintText: '***********',
                          textInputAction: TextInputAction.none,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == "") {
                              return "This field can't be empty";
                            }
                            return null;
                          },
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: PrimaryButton(
                            onPressed: () {},
                            child: Text('Reset Password',
                                style: CustomTextStyles.kBold16.copyWith(
                                    color: CustomColors.kfullWhite,
                                    fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
