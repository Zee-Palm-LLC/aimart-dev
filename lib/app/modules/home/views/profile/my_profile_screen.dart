import 'package:aimart_dev/app/data/constants/assets.dart';
import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/primary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(title: 'Profile'),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Center(
            child: CircleAvatar(
              radius: 70.r,
              backgroundImage: AssetImage(CustomAssets.kdummyUserPic),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Alex Christian', style: CustomTextStyles.kBold20),
          SizedBox(height: 4.h),
          Text('CEO at AIMART',
              style: CustomTextStyles.kMedium14
                  .copyWith(color: CustomColors.kGrey)),
          SizedBox(height: 32.h),
          PrimaryButton(
              onPressed: () {},
              child: Row(
                children: [],
              ))
        ],
      ),
    );
  }
}
