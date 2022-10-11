import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/constants/constants.dart';
import '../../widgets/widgets.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  CreateNewPasswordScreen({Key? key}) : super(key: key);

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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          children: [
            SizedBox(height: 20.h),
            Text('Create New Password',
                style: CustomTextStyles.kBold24
                    .copyWith(color: CustomColors.kDarkTextColor)),
            SizedBox(height: 8.h),
            Padding(
                padding: EdgeInsets.only(right: 100.w),
                child: Text('Enter your email account to reset your password',
                    style: CustomTextStyles.kMedium14
                        .copyWith(color: CustomColors.kGrey))),
            SizedBox(height: 32.h),
            Text('New Password',
                style: CustomTextStyles.kBold16
                    .copyWith(color: CustomColors.kDarkTextColor)),
            SizedBox(height: 12.h),
            CustomTextFormField(
              controller: _newPassword,
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
                if (value == "") {
                  return "This field can't be empty";
                }
                return null;
              },
              onChange: (value) {},
            ),
            SizedBox(height: 32.h),
            PrimaryButton(
              onPressed: () {},
              child: Text('Reset Password',
                  style: CustomTextStyles.kBold16
                      .copyWith(color: CustomColors.kfullWhite, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
