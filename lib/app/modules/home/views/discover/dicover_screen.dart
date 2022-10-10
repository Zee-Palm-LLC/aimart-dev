import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/textfields/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/discover/custom_discount_widget.dart';
import '../../widgets/home/custom_chips.dart';
import '../home/home_screen.dart';

class DicoverScreen extends StatefulWidget {
  const DicoverScreen({super.key});

  @override
  State<DicoverScreen> createState() => _DicoverScreenState();
}

class _DicoverScreenState extends State<DicoverScreen> {
  TextEditingController sController = TextEditingController();
  int selectIndex = 0;
  List<String> list = ['All', 'Woman', 'Men', 'Kids'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(title: 'Discovery'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: SearchBar(
                    controller: sController,
                    hintText: 'What are you looking for?',
                  ),
                ),
                SizedBox(width: 12.h),
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: CustomElevatedButton(
                    child: SvgPicture.asset(CustomAssets.kfiltericon),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(height: 32.h),
            SizedBox(
              height: 42.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomChips(
                      textColor: selectIndex == index
                          ? CustomColors.kfullWhite
                          : CustomColors.kGrey,
                      color: selectIndex == index
                          ? CustomColors.kPrimary
                          : CustomColors.kLightBackground,
                      borderColor: selectIndex == index
                          ? CustomColors.kPrimary
                          : CustomColors.kGrey.withOpacity(0.3),
                      onPress: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      title: list[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.w);
                  },
                  itemCount: 4),
            ),
            SizedBox(height: 28.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 156.w / 200.h,
                ),
                itemBuilder: (context, index) {
                  return CustomDiscountWidget(
                    onTap: () {},
                    favouriteCallback: () {},
                    isFavourite: CustomColors.kDivider,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
