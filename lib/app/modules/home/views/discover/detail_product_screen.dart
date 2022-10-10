import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/discover/detail_product.dart';
import '../cart/cart_screen.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  PageController controller = PageController();
  int sizeIndex = 0;
  List<String> listOfSize = [
    'XXL',
    'XL',
    'L',
    'M',
    'S',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kLightBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Detail Product',
          style: CustomTextStyles.kMedium16.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: CustomColors.kDarkBblue),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              CustomAssets.kShoppingBag,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 335.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: CustomColors.cardGridentColor,
                    ),
                  ),
                  child: PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, myIndex) {
                      return CustomDetailProduct(
                        currentIndex: myIndex,
                        controller: controller,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Container(
                  width: 320.w,
                  color: CustomColors.kLightBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mambo Sport Premium',
                        style: CustomTextStyles.kBold20.copyWith(
                            color: CustomColors.kDarkBblue, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('T-Shirt', style: CustomTextStyles.kMedium16),
                      SizedBox(
                        height: 33.h,
                      ),
                      Text('Size :',
                          style: CustomTextStyles.kBold20.copyWith(
                              color: CustomColors.kDarkBblue, fontSize: 16)),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 42.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  sizeIndex = index;
                                });
                              },
                              child: Container(
                                width: 43,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sizeIndex == index
                                      ? CustomColors.kPrimary
                                      : CustomColors.kfullWhite,
                                ),
                                child: Center(
                                  child: Text(
                                    listOfSize[index],
                                    style: CustomTextStyles.kMedium12.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: sizeIndex == index
                                          ? CustomColors.kfullWhite
                                          : CustomColors.kDarkBblue,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      SizedBox(
                        width: 345.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description',
                                style: CustomTextStyles.kBold20.copyWith(
                                    color: CustomColors.kDarkBblue,
                                    fontSize: 16)),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                                """Welcome to Fujitora store, we always serve you wholeheartedly.

The premium Mambo sport brand is a shirt with the best quality, with the following details:
    • 4.3 oz./yd², 100% recycled polyester
    • Hydrophilic finish
    • Classic fit
    • UPF 25 protection """,
                                style: CustomTextStyles.kMedium12.copyWith(
                                    color: CustomColors.kGrey, fontSize: 12)),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text('Review',
                                style: CustomTextStyles.kBold20.copyWith(
                                    color: CustomColors.kDarkBblue,
                                    fontSize: 16)),
                            SizedBox(
                              width: 6.w,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: CustomColors.kGolden,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                const Text('4.8'),
                                SizedBox(
                                  width: 6.w,
                                ),
                                const Text('(1.342 Review)'),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            ...List.generate(
                                2,
                                (index) => ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                      leading: const CircleAvatar(),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Jenny Christy',
                                                style: CustomTextStyles
                                                    .kMedium14
                                                    .copyWith(
                                                        color: CustomColors
                                                            .kDarkBblue,
                                                        fontSize: 15)),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Wrap(
                                              children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                        Icons.star,
                                                        color: CustomColors
                                                            .kGolden,
                                                      )),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Text(
                                          'Perfect for keeping your body dry and warm in humid conditions.',
                                          style: CustomTextStyles.kMedium12
                                              .copyWith(
                                                  color: CustomColors.kGrey,
                                                  fontSize: 12)),
                                      trailing: Text('Today',
                                          style: CustomTextStyles.kMedium12
                                              .copyWith(
                                                  color: CustomColors.kGrey,
                                                  fontSize: 12)),
                                    )),
                          ],
                        ),
                      ),
                      PrimaryButton(
                        onPressed: () {},
                        color: CustomColors.kfullWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'View All Review',
                              style: CustomTextStyles.kMedium12.copyWith(
                                color: CustomColors.kGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        width: 375.w,
        color: CustomColors.kWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: CustomTextStyles.kMedium12
                        .copyWith(color: CustomColors.kGrey, fontSize: 12),
                  ),
                  Text(
                    '\$19.99',
                    style: CustomTextStyles.kMedium14.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.kDiscountTextColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 173.w,
              height: 62.h,
              child: PrimaryButton(
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                color: CustomColors.kPrimary,
                child: Text(
                  'Add To Cart',
                  style: CustomTextStyles.kMedium16.copyWith(
                    fontSize: 16,
                    color: CustomColors.kfullWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
