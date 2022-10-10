import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/dialogs/custom_dialog.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: defaultOverlay,
      ),
      body: SingleChildScrollView(
        child: Stack(
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
                    'OTP Verification',
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
                      'Enter the verification code  we just sent on your email address',
                      style: CustomTextStyles.kMedium14
                          .copyWith(color: CustomColors.kGrey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 26.w),
                    child: PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 52.h,
                        fieldWidth: 68.w,
                        activeFillColor: CustomColors.kLightBackground,
                        activeColor: CustomColors.kPinCode,
                        borderWidth: 1.5.w,
                        selectedFillColor: CustomColors.kLightBackground,
                        inactiveFillColor: CustomColors.kLightBackground,
                        selectedColor: CustomColors.kPinCode,
                        errorBorderColor: CustomColors.kError,
                        inactiveColor: CustomColors.kPinCode,
                      ),
                      hintCharacter: '_',
                      hintStyle: CustomTextStyles.kMedium16.copyWith(
                        color: CustomColors.kGrey,
                        fontSize: 16.sp,
                      ),
                      keyboardType: TextInputType.phone,
                      textStyle: CustomTextStyles.kMedium16.copyWith(
                          color: CustomColors.kPinCodeTextColor, fontSize: 16),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        if (kDebugMode) {
                          print("Completed");
                        }
                      },
                      onChanged: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                        setState(() {});
                      },
                      appContext: context,
                      beforeTextPaste: (text) {
                        if (kDebugMode) {
                          print("Allowing to paste $text");
                        }
                        return true;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: SizedBox(
                      width: 360.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 33.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: PrimaryButton(
                              onPressed: () {
                                CustomDialogBox(
                                    heading: 'Password updated successfully',
                                    description:
                                        'Please login again to get started',
                                    svgIcon: CustomAssets.kDone);
                              },
                              child: Text('Verify',
                                  style: CustomTextStyles.kBold16.copyWith(
                                      color: CustomColors.kfullWhite,
                                      fontSize: 16)),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: startTimer,
                                child: const Text('Resend code in'),
                              ),
                              Text('$minutes : $seconds'),
                            ],
                          ),
                          SizedBox(
                            height: 304.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: Text.rich(
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.ltr,
                                TextSpan(
                                  style: CustomTextStyles.kMedium12.copyWith(
                                    color: CustomColors.kGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "Didn't receive the code? Check your email spam folder ",
                                      style:
                                          CustomTextStyles.kMedium12.copyWith(
                                        color: CustomColors.kGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Use another email address?',
                              style: CustomTextStyles.kMedium12.copyWith(
                                color: CustomColors.kRichButton,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
