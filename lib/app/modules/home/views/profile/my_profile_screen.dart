import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/views/auth/create_new_password.dart';
import 'package:aimart_dev/app/modules/home/views/profile/my_payment_card.dart';
import 'package:aimart_dev/app/modules/home/views/profile/profile_detail.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/primary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/profileWidgets/custom_listTile.dart';
import 'package:aimart_dev/app/modules/home/widgets/profileWidgets/heading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(title: 'Profile'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 10.h),
          Center(
            child: CircleAvatar(
              radius: 70.r,
              backgroundImage: AssetImage(CustomAssets.kdummyUserPic),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text('Alex Christian',
                style: CustomTextStyles.kBold20
                    .copyWith(color: CustomColors.kDarkBblue)),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Text('CEO at AIMART',
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
                    Get.to(() => ProfileDetailScreen());
                  },
                  icon:
                      SvgPicture.asset(CustomAssets.kpersonIcon, height: 20.h),
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
                  icon:
                      SvgPicture.asset(CustomAssets.kpaymentCard, height: 20.h),
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
                  icon: SvgPicture.asset(CustomAssets.kcontactUs, height: 20.h),
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
                  icon: SvgPicture.asset(CustomAssets.ksecurity, height: 20.h),
                  text: 'Privacy and Policy',
                ),
                Divider(color: CustomColors.kDivider, height: 0.h),
                CustomListTile(
                  onTap: () {
                    Get.to(() => CreateNewPasswordScreen());
                  },
                  icon: SvgPicture.asset(CustomAssets.kpasswordChange,
                      height: 20.h),
                  text: 'Change password',
                ),
                Divider(color: CustomColors.kDivider, height: 0.h),
                CustomListTile(
                  onTap: () {},
                  icon: SvgPicture.asset(CustomAssets.klogout, height: 20.h),
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
