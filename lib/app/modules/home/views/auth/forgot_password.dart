import 'package:aimart_dev/app/modules/home/views/auth/login_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/background_card.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/textfields/custom_textFormField.dart';
import 'otp_verify_screen.dart';

class FogetPasswordScreen extends StatelessWidget {
  FogetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: defaultOverlay,
      ),
      body: BackGroundCard(
        child: Form(
          key: globalKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            children: [
              SizedBox(height: 20.h),
              Text('Forgot Password',
                  style: CustomTextStyles.kBold24
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 8.h),
              Padding(
                  padding: EdgeInsets.only(right: 60.w),
                  child: Text('Enter your email account to reset your password',
                      style: CustomTextStyles.kMedium14
                          .copyWith(color: CustomColors.kGrey))),
              SizedBox(height: 32.h),
              Text('Your Email',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kDarkTextColor)),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: emailcontroller,
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
              SizedBox(height: 32.h),
              PrimaryButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    Get.to(() => OTPVerifyScreen());
                  }
                },
                child: Text('Send Code',
                    style: CustomTextStyles.kBold16
                        .copyWith(color: CustomColors.kfullWhite)),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: CustomColors.kLightBackground,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Remember Password?",
              style: CustomTextStyles.kMedium12.copyWith(
                color: CustomColors.kGrey,
              )),
          SizedBox(width: 5.w),
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
