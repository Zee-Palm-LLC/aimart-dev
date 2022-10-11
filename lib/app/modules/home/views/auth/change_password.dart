import 'package:aimart_dev/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController ac = Get.find<AuthController>();
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: defaultOverlay,
      ),
      body: BackGroundCard(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            children: [
              SizedBox(height: 20.h),
              Text('Change Password',
                  style: CustomTextStyles.kBold24
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 8.h),
              Padding(
                  padding: EdgeInsets.only(right: 100.w),
                  child: Text(
                      'Enter your current password to change your password',
                      style: CustomTextStyles.kMedium14
                          .copyWith(color: CustomColors.kGrey))),
              SizedBox(height: 32.h),
              Text('Current Password',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: _currentPassword,
                isPasswordField: true,
                hintText: '***********',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == "") {
                    return "This field can't be empty";
                  } else if (value!.length < 6) {
                    return 'Your password lenght must be greater than 6';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Text('New Password',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: _password,
                isPasswordField: true,
                hintText: '***********',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == "") {
                    return "This field can't be empty";
                  } else if (value!.length < 6) {
                    return 'Your password lenght must be greater than 6';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Text('Confirm Password',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                  controller: _confirmPassword,
                  isPasswordField: true,
                  hintText: '***********',
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (_confirmPassword.text != _password.text) {
                      return "Password doen't match";
                    }
                    return null;
                  }),
              SizedBox(height: 32.h),
              PrimaryButton(
                onPressed: () async {
                  await ac.changePassword(
                      currentPassword: _currentPassword.text,
                      newPassword: _password.text);
                },
                child: Text('Change Password',
                    style: CustomTextStyles.kBold16.copyWith(
                        color: CustomColors.kfullWhite, fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
