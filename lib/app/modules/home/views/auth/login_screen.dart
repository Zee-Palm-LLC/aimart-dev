import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/views/landingScreen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'forgot_password.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
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
          key: globalKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            children: [
              SizedBox(height: 20.h),
              Text('Login',
                  style: CustomTextStyles.kBold24
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 8.h),
              Text(
                'Please login to your account',
                style: CustomTextStyles.kMedium14
                    .copyWith(color: CustomColors.kGrey),
              ),
              SizedBox(height: 32.h),
              Text(
                'Username',
                style: CustomTextStyles.kBold16
                    .copyWith(color: CustomColors.kDarkTextColor),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: usernameController,
                isPasswordField: false,
                hintText: 'Enter your username..',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  } else if (!value.isEmail) {
                    return 'Enter a valid email address';
                  }

                  return null;
                },
              ),
              SizedBox(height: 20.h),
              Text('Password',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: passwordController,
                isPasswordField: true,
                hintText: '***********',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == "") {
                    return "This field can't be empty";
                  } else if (value!.length < 6) {
                    return 'Your password lenght must be greater than 6';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Get.to(() => FogetPasswordScreen());
                    },
                    child: Text('Forgot Password ?',
                        style: CustomTextStyles.kMedium16)),
              ),
              SizedBox(height: 28.h),
              PrimaryButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    Get.to(() => LandingPage());
                  }
                },
                child: Text('Login',
                    style: CustomTextStyles.kBold16
                        .copyWith(color: CustomColors.kfullWhite)),
              ),
              SizedBox(height: 24.h),
              Text(
                "Or login with account",
                style: CustomTextStyles.kBold12
                    .copyWith(color: CustomColors.kGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              PrimaryButton(
                color: CustomColors.kWhite,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(CustomAssets.kGoogle),
                    SizedBox(width: 15.h),
                    Text(
                      'Google',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kDarkTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              PrimaryButton(
                color: CustomColors.kWhite,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      CustomAssets.kFacebook,
                      width: 20,
                      height: 15,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      'Facebook',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kDarkTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: CustomColors.kLightBackground,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Don't have a account?",
              style: CustomTextStyles.kMedium12.copyWith(
                color: CustomColors.kGrey,
              )),
          TextButton(
            onPressed: () {
              Get.to(() => SignUpScreen());
            },
            child: Text("Sign Up",
                style: CustomTextStyles.kBold12
                    .copyWith(color: CustomColors.kPrimary)),
          ),
        ]),
      ),
    );
  }
}
