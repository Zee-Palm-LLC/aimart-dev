import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/controllers/auth_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/user_controller.dart';
import 'package:aimart_dev/app/modules/home/views/auth/change_password.dart';
import 'package:aimart_dev/app/modules/home/views/profile/my_payment_card.dart';
import 'package:aimart_dev/app/modules/home/views/profile/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../models/user_model.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  AuthController ac = Get.find<AuthController>();
  UserController uc = Get.find<UserController>();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UserModel user = uc.user;
      return Scaffold(
        appBar: primaryAppbar(title: 'Profile'),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 10.h),
            Center(
                child: OptimizedCacheImage(
              placeholder: (context, url) => CircleAvatar(
                radius: 70.r,
                backgroundColor: CustomColors.kDivider,
                child: Icon(Icons.person, color: Colors.black, size: 40.h),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 70.r,
                backgroundColor: CustomColors.kDivider,
                child: Icon(Icons.error, color: Colors.red, size: 40.h),
              ),
              fit: BoxFit.contain,
              imageUrl: user.profilePic ?? '',
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 70.r,
                  backgroundImage: imageProvider,
                );
              },
            )),
            SizedBox(height: 20.h),
            Center(
              child: Text(user.fullName ?? '',
                  style: CustomTextStyles.kBold20
                      .copyWith(color: CustomColors.kDarkBblue)),
            ),
            SizedBox(height: 4.h),
            Center(
              child: Text(user.bio ?? '',
                  style: CustomTextStyles.kMedium14
                      .copyWith(color: CustomColors.kGrey)),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: PrimaryButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Upgrade Account - Pro",
                        style: CustomTextStyles.kBold16,
                      ),
                      SizedBox(width: 9.67.w),
                      SvgPicture.asset(CustomAssets.kupgradeIcon)
                    ],
                  )),
            ),
            SizedBox(height: 32.h),
            const HeadingCard(
              heading: 'My Account',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                children: [
                  CustomListTile(
                    onTap: () {
                      Get.to(() => ProfileDetailScreen(
                            user: user,
                          ));
                    },
                    icon: SvgPicture.asset(CustomAssets.kpersonIcon,
                        height: 20.h),
                    text: 'Detail Profile',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon: SvgPicture.asset(CustomAssets.kfavouriteinactive,
                        height: 20.h),
                    text: 'Wishlist',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon: SvgPicture.asset(CustomAssets.kstar, height: 20.h),
                    text: 'My Review',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {
                      Get.to(() => MyPaymentScreen());
                    },
                    icon: SvgPicture.asset(CustomAssets.kpaymentCard,
                        height: 20.h),
                    text: 'My Payment',
                  ),
                ],
              ),
            ),
            const HeadingCard(
              heading: 'Preferences',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                children: [
                  CustomListTile(
                    onTap: () {},
                    icon: SvgPicture.asset(CustomAssets.kpushNotification,
                        height: 20.h),
                    text: 'Push Notification',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon: SvgPicture.asset(CustomAssets.klanguageIcon,
                        height: 20.h),
                    text: 'Language',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon:
                        SvgPicture.asset(CustomAssets.kcontactUs, height: 20.h),
                    text: 'Contact Us',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon: SvgPicture.asset(CustomAssets.ksend, height: 20.h),
                    text: 'Send Feedback',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {},
                    icon:
                        SvgPicture.asset(CustomAssets.ksecurity, height: 20.h),
                    text: 'Privacy and Policy',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () {
                      Get.to(() => ChangePasswordScreen());
                    },
                    icon: SvgPicture.asset(CustomAssets.kpasswordChange,
                        height: 20.h),
                    text: 'Change password',
                  ),
                  Divider(color: CustomColors.kDivider, height: 0.h),
                  CustomListTile(
                    onTap: () async {
                      await ac.signOut();
                    },
                    icon: SvgPicture.asset(CustomAssets.klogout, height: 20.h),
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}