import 'dart:io';

import 'package:aimart_dev/app/modules/home/views/auth/otp_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/widgets.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  File? image;
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
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            children: [
              SizedBox(height: 20.h),
              Text('Sign Up',
                  style: CustomTextStyles.kBold24
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 8.h),
              Text(
                'Create your account',
                style: CustomTextStyles.kMedium14
                    .copyWith(color: CustomColors.kGrey),
              ),
              SizedBox(height: 32.h),
              Center(
                  child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: CustomColors.kGrey.withOpacity(0.05),
                    child: image != null
                        ? Image.file(image!)
                        : Icon(
                            Icons.person,
                            size: 30.sp,
                            color: CustomColors.kBlack,
                          ),
                  ),
                  CircleAvatar(
                    radius: 20.r,
                    child: IconButton(
                      onPressed: () {
                        ImagePickerDialogBox.pickSingleImage((file) {
                          setState(() {
                            image = file;
                          });
                        });
                      },
                      icon: SvgPicture.asset(CustomAssets.kadd,
                          color: CustomColors.kWhite, height: 20.h),
                    ),
                  )
                ],
              )),
              Text('Name',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: userNamecontroller,
                isPasswordField: false,
                hintText: 'Enter your name..',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Text(
                'Email',
                style: CustomTextStyles.kBold16.copyWith(
                  color: CustomColors.kDarkTextColor,
                ),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: emailController,
                isPasswordField: false,
                hintText: 'Example@email.com',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "This field can't be empty";
                  }

                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Text('Bio',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: bioController,
                isPasswordField: false,
                hintText: 'Enter your bio',
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "This field can't be empty";
                  }

                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Text('Password',
                  style: CustomTextStyles.kMedium16
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
                  }

                  return null;
                },
              ),
              SizedBox(height: 12.h),
              Text.rich(
                TextSpan(
                  style: CustomTextStyles.kMedium12.copyWith(
                    color: CustomColors.kGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                        text: 'Note :',
                        style: CustomTextStyles.kMedium12.copyWith(
                          color: CustomColors.kGrey,
                        )),
                    TextSpan(
                        text: ' With register, you agree to the',
                        style: CustomTextStyles.kMedium12
                            .copyWith(color: CustomColors.kGrey)),
                    TextSpan(
                      text: '  Terms & Conditions ',
                      style: CustomTextStyles.kMedium12.copyWith(
                        color: CustomColors.kGrey.withOpacity(0.7),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: 'and',
                      style: CustomTextStyles.kMedium12.copyWith(
                        color: CustomColors.kGrey,
                      ),
                    ),
                    TextSpan(
                      text: ' Privacy Policy.',
                      style: CustomTextStyles.kMedium12.copyWith(
                        color: CustomColors.kGrey.withOpacity(0.7),
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 28.h),
              PrimaryButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    Get.to(() => OTPVerifyScreen());
                  }
                },
                child: Text('Register',
                    style: CustomTextStyles.kBold16.copyWith(
                        color: CustomColors.kfullWhite, fontSize: 16)),
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: CustomColors.kLightBackground,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Already have an accont?",
              style: CustomTextStyles.kMedium12.copyWith(
                color: CustomColors.kGrey,
              )),
          TextButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            child: Text("Login",
                style: CustomTextStyles.kBold12
                    .copyWith(color: CustomColors.kPrimary)),
          ),
        ]),
      ),
    );
  }
}
