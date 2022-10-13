import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../widgets/discover/discover_card.dart';
import '../../widgets/home/custom_chips.dart';

class DicoverScreen extends StatefulWidget {
  const DicoverScreen({super.key});

  @override
  State<DicoverScreen> createState() => _DicoverScreenState();
}

class _DicoverScreenState extends State<DicoverScreen> {
  TextEditingController sController = TextEditingController();
  int selectIndex = 0;
  ProductController pc = Get.find<ProductController>();
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
                    child: InkWell(
                  onTap: () {
                    // Get.to(() => SearchScreen());
                  },
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: CustomColors.kLightBackground,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: CustomColors.kGrey.withOpacity(0.5))),
                    child: Row(
                      children: [
                        SvgPicture.asset(CustomAssets.ksearch),
                        SizedBox(width: 10.w),
                        Text("What are you looking for",
                            style: CustomTextStyles.kMedium14.copyWith(
                              color: CustomColors.kGrey2,
                            ))
                      ],
                    ),
                  ),
                )),
                SizedBox(width: 12.w),
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: PrimaryButton(
                    child: SvgPicture.asset(CustomAssets.kfiltericon),
                    onPressed: () {
                      // Get.to(() => SearchScreen());
                    },
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
                  itemCount: list.length),
            ),
            SizedBox(height: 28.h),
            Obx(() {
              return pc.allproductList?.isEmpty ?? true
                  ? Center(
                      child: Text(
                        'No Products',
                        style: CustomTextStyles.kBold20,
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: pc.allproductList?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 156.w / 200.h,
                        ),
                        itemBuilder: (context, index) {
                          return DiscoverCard(
                            onTap: () {},
                            product: pc.allproductList![index],
                            favouriteCallback: () {},
                            isFavourite: CustomColors.kDivider,
                          );
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
