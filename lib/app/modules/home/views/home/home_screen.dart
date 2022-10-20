import 'package:aimart_dev/app/data/helper/product_category.dart';
import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_dev/app/modules/home/views/discover/detail_product_screen.dart';
import 'package:aimart_dev/app/modules/home/views/notification.dart/notification_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/user_controller.dart';
import '../../models/product_model.dart';
import '../../models/user_model.dart';
import '../../widgets/widgets.dart';
import '../search/search_screen.dart';
import 'flash_sale_screen.dart';
import 'home_mostpopular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController uc = Get.find<UserController>();
  ProductController pc = Get.find<ProductController>();
  int selectedIndex = 0;

  Rx<ProductCategory> _selectedCategory = ProductCategory.all.obs;
  ProductCategory get selectedCategory => _selectedCategory.value;
  int currentPos = 0;
  List<Product>? productCategoryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.kLightBackground,
          title: Obx(() {
            UserModel user = uc.user;
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  OptimizedCacheImage(
                    placeholder: (context, url) => CircleAvatar(
                      radius: 20.r,
                      backgroundColor: CustomColors.kDivider,
                      child:
                          Icon(Icons.person, color: Colors.black, size: 40.h),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 20.r,
                      backgroundColor: CustomColors.kDivider,
                      child: Icon(Icons.error, color: Colors.red, size: 40.h),
                    ),
                    fit: BoxFit.contain,
                    imageUrl: user.profilePic ?? '',
                    imageBuilder: (context, imageProvider) {
                      return CircleAvatar(
                        radius: 20.r,
                        backgroundImage: imageProvider,
                      );
                    },
                  ),
                  SizedBox(width: 11.w),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${user.fullName}',
                            style: CustomTextStyles.kBold16
                                .copyWith(color: CustomColors.kDarkBlue)),
                        SizedBox(height: 2.h),
                        Text(
                          'Find your best fashion here',
                          style: CustomTextStyles.kMedium12
                              .copyWith(color: CustomColors.kGrey),
                        ),
                      ]),
                ],
              ),
            );
          }),
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
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: CustomColors.kLightBackground,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: CustomColors.kGrey2)),
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
                        Get.to(() => SearchScreen());
                      },
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
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      },
                      viewportFraction: 1,
                      height: 188.h,
                    ),
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
                                fit: BoxFit.cover,
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                            ),
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
              Obx(() {
                return pc.allproductList?.isEmpty ?? true
                    ? Center(
                        child: Text("No Products",
                            style: CustomTextStyles.kBold20))
                    : Column(
                        // show me filter scre
                        children: [
                          SizedBox(
                            height: 42.h,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CustomChips(
                                    textColor: selectedCategory ==
                                            ProductCategory.values[index]
                                        ? CustomColors.kWhite
                                        : CustomColors.kGrey,
                                    color: selectedCategory ==
                                            ProductCategory.values[index]
                                        ? CustomColors.kPrimary
                                        : CustomColors.kBackground,
                                    borderColor: selectedCategory ==
                                            ProductCategory.values[index]
                                        ? CustomColors.kPrimary
                                        : CustomColors.kGrey.withOpacity(0.3),
                                    onPress: () {
                                      _selectedCategory.value =
                                          ProductCategory.values[index];
                                    },
                                    title: ProductCategory
                                        .values[index].name.capitalizeFirst
                                        .toString(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 12.w);
                                },
                                itemCount: ProductCategory.values.length),
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
                          SizedBox(height: 24.h),
                          FutureBuilder<List<Product>?>(
                              future: pc.getFilteredProducts(
                                  category: selectedCategory),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                List<Product>? categoriesList = snapshot.data!;
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categoriesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageCard(
                                      onPressed: () {
                                        Get.to(() => DetailProductScreen(
                                            product: categoriesList[index]));
                                      },
                                      favoriteCallback: () async {
                                        pc.savedProductsIds!.contains(
                                                categoriesList[index].productId)
                                            ? await pc.deleteFromFavorite(
                                                product: categoriesList[index])
                                            : await pc.addToFavorite(
                                                product: categoriesList[index]);
                                      },
                                      isLike: pc.savedProductsIds!.contains(
                                              categoriesList[index].productId)
                                          ? CustomColors.kError
                                          : CustomColors.kDivider,
                                      product: categoriesList[index],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(height: 20.h);
                                  },
                                );
                              })
                        ],
                      );
              }),
            ]));
  }
}
