import 'package:aimart_dev/app/data/helper/product_category.dart';
import 'package:aimart_dev/app/modules/home/views/home/home_flashsale.dart';
import 'package:aimart_dev/app/modules/home/views/home/home_mostpopular.dart';
import 'package:aimart_dev/app/modules/home/views/notification.dart/notification_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/custom_chips.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/custom_text_button.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/display_item_container.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/search_text_feild.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/product_model.dart';
import '../search/search_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    List<Product> allList = displayproduct;
    print(allList.length);
    super.initState();
  }

  var _searchController = TextEditingController();

  int currentPos = 0;
  List<String> list = ['All', 'Woman', 'Men', 'Kids'];
  int selectIndex = 0;
  List<Product> women = displayproduct
      .where((element) => element.productCategory == ProductCategory.women)
      .toList();
  List<Product> men = displayproduct
      .where((element) => element.productCategory == ProductCategory.men)
      .toList();
  List<Product> kids = displayproduct
      .where((element) => element.productCategory == ProductCategory.kids)
      .toList();
  ProductCategory productCategory = ProductCategory.all;
  List<Product> dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.kLightBackground,
          title: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 20.r,
                    backgroundImage: AssetImage(CustomAssets.kprofilepic)),
                SizedBox(width: 11.w),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Hello Albert',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kDarkBblue)),
                  SizedBox(height: 2.h),
                  Text(
                    'Find your best fashion here',
                    style: CustomTextStyles.kMedium12
                        .copyWith(color: CustomColors.kGrey),
                  ),
                ]),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 28.w),
              child: InkWell(
                onTap: () {
                  Get.to(() => NotificationScreen());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: Image.asset(CustomAssets.knotificationbell,
                              fit: BoxFit.contain),
                        )
                      ],
                    ),
                    Positioned(
                        top: 11,
                        right: 0,
                        child: Container(
                          height: 12.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.kError),
                          alignment: Alignment.center,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(() => SearchScreen());
                    },
                    child: CustomTextFormField(
                      isEnabled: false,
                      controller: _searchController,
                      hintText: 'What are you looking for?',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  )),
                  SizedBox(width: 12.w),
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
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        },
                        viewportFraction: 1,
                        height: 188.h),
                    items: [
                      CustomAssets.ksale,
                      CustomAssets.ksale,
                      CustomAssets.ksale,
                      CustomAssets.ksale,
                      CustomAssets.ksale
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: 188.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                image: AssetImage(i),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flash Sale 50%',
                            style: CustomTextStyles.kBold24
                                .copyWith(color: CustomColors.kWhite),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '01 Agu-24 Sep 2022',
                            style: CustomTextStyles.kMedium12
                                .copyWith(color: CustomColors.kWhite),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              Get.to(() => HomeFlashSale());
                            },
                            child: Text(
                              'Explore Now',
                              style: CustomTextStyles.kBold12
                                  .copyWith(color: CustomColors.kWhite),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          AnimatedSmoothIndicator(
                            activeIndex: currentPos,
                            count: 5,
                            effect: ExpandingDotsEffect(
                                spacing: 8.0,
                                radius: 2.0,
                                dotWidth: 14.0,
                                dotHeight: 3.0,
                                paintStyle: PaintingStyle.fill,
                                strokeWidth: 0.5,
                                dotColor: CustomColors.kGrey,
                                activeDotColor: CustomColors.kWhite),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 42.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomChips(
                        textColor: selectIndex == index
                            ? CustomColors.kWhite
                            : CustomColors.kGrey,
                        color: selectIndex == index
                            ? CustomColors.kPrimary
                            : CustomColors.kBackground,
                        borderColor: selectIndex == index
                            ? CustomColors.kPrimary
                            : CustomColors.kGrey.withOpacity(0.3),
                        onPress: () {
                          setState(() {
                            if (index == 0) {
                              productCategory = ProductCategory.all;
                              dataList = displayproduct;
                            }

                            if (index == 1) {
                              productCategory = ProductCategory.women;
                              dataList = women;
                            }

                            if (index == 2) {
                              productCategory = ProductCategory.men;
                              dataList = men;
                            }

                            if (index == 3) {
                              productCategory = ProductCategory.kids;
                              dataList = kids;
                            }
                            selectIndex = index;
                          });
                        },
                        title: list[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 12.w,
                      );
                    },
                    itemCount: 4),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    'Most Popular',
                    style: CustomTextStyles.kBold20
                        .copyWith(color: CustomColors.kPrimary),
                  ),
                  const Spacer(),
                  CustomTextButton(
                      text: "See All",
                      onPressed: () {
                        Get.to(() => HomeMostPopular());
                      }),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DisplayItemContainer(
                    onPressed: () {
                      favouriteList.contains(dataList[index])
                          ? favouriteList.remove(dataList[index])
                          : favouriteList.add(dataList[index]);
                      setState(() {});
                    },
                    isLike: favouriteList.contains(dataList[index])
                        ? CustomColors.kError
                        : CustomColors.kDivider,
                    product: dataList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
              )
            ]));
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // fixedSize: Size(103.w, 32.h),
          primary: CustomColors.kbrandblue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
      onPressed: onPressed,
      child: child,
    );
  }
}

List<Product> favouriteList = [];
