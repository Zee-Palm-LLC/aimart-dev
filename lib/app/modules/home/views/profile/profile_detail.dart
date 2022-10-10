import 'package:aimart_dev/app/modules/home/widgets/appbar/secondary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/textfields/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/constants.dart';

class ProfileDetailScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppbar(title: 'Detail Profile'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        children: [
          SizedBox(height: 10.h),
          //Profile Avatar
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 70.r,
                  backgroundImage: AssetImage(CustomAssets.kdummyUserPic),
                ),
                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                        color: CustomColors.kPrimary,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: CustomColors.kWhite, width: 2.w)),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(CustomAssets.kcamera)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 32.h),
          //Info
          Text('Full Name',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _nameController,
              isPasswordField: false,
              hintText: 'Alex Christian',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              validator: (value) {}),
          SizedBox(height: 20.h),
          Text('Username',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _nameController,
              isPasswordField: false,
              hintText: 'Alex0321',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              validator: (value) {}),
          SizedBox(height: 20.h),
          Text('E-Mail',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _emailController,
              isPasswordField: false,
              hintText: 'alexchristi03@gmail.com',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {}),
          SizedBox(height: 20.h),
          Text('Bio',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _bioController,
              isPasswordField: false,
              hintText: 'CEO at AIMART',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              validator: (value) {}),
          SizedBox(height: 52.h),
          PrimaryButton(
              onPressed: () {},
              child: Text("Save Changes", style: CustomTextStyles.kBold16))
        ],
      ),
    );
  }
}
