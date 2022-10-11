import 'dart:io';
import 'package:aimart_dev/app/modules/home/controllers/user_controller.dart';
import 'package:aimart_dev/app/modules/home/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/widgets.dart';

class ProfileDetailScreen extends StatefulWidget {
  UserModel user;
  ProfileDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  File? image;
  UserController uc = Get.find<UserController>();

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
                    backgroundImage: image == null
                        ? NetworkImage(
                            widget.user.profilePic!,
                          )
                        : FileImage(image!) as ImageProvider),
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
                        onPressed: () {
                          ImagePickerDialogBox.pickSingleImage((file) {
                            setState(() {
                              image = file;
                            });
                          });
                        },
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
              hintText: 'Enter your name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your FullName';
                }
                return null;
              }),
          SizedBox(height: 20.h),
          Text('Username',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _usernameController,
              isPasswordField: false,
              hintText: 'Enter your username',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your Username';
                }
                return null;
              }),
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
          Text('Bio',
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 8.h),
          CustomTextFormField(
              controller: _bioController,
              isPasswordField: false,
              hintText: 'Enter your bio',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your Bio';
                }
                return null;
              }),
          SizedBox(height: 52.h),
          PrimaryButton(
              onPressed: () async {
                await uc.updateUserInfo(
                    fullName: _nameController.text,
                    userName: _usernameController.text.trim(),
                    email: _emailController.text.trim(),
                    bio: _bioController.text,
                    imageFile: image);
              },
              child: Text("Save Changes", style: CustomTextStyles.kBold16))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    _nameController.text = widget.user.fullName!;
    _usernameController.text = widget.user.username!;
    _emailController.text = widget.user.email!;
    _bioController.text = widget.user.bio!;
  }
}
