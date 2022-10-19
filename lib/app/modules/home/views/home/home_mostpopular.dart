import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_dev/app/modules/home/views/discover/detail_product_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/sale_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:get/get.dart';

import '../../../../data/helper/product_category.dart';
import '../../models/product_model.dart';
import '../../widgets/widgets.dart';

class HomeMostPopular extends StatefulWidget {
  const HomeMostPopular({super.key});

  @override
  State<HomeMostPopular> createState() => _HomeMostPopularState();
}

class _HomeMostPopularState extends State<HomeMostPopular> {
  bool isView = false;
  int selectedIndex = 0;
  ProductController pc = Get.find<ProductController>();
  ProductCategory productCategory = ProductCategory.all;
  List<Product>? productCategoryList = [];
  List<String> categories = ['All', 'Women', 'Men', 'Kids'];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: actionsAppbar(title: 'Home', actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: CustomColors.kDarkBlue,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 28.w, left: 14.w),
            child: CartNotificationButton(
              onPressed: () {},
              isNotification: true,
            ),
          ),
        ]),
        body: Obx(() {
          return pc.allproductList?.isEmpty ?? true
              ? Center(
                  child: Text("No Products", style: CustomTextStyles.kBold20))
              : Column(
                  children: [
                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomChips(
                              textColor: selectedIndex == index
                                  ? CustomColors.kWhite
                                  : CustomColors.kGrey,
                              color: selectedIndex == index
                                  ? CustomColors.kPrimary
                                  : CustomColors.kBackground,
                              borderColor: selectedIndex == index
                                  ? CustomColors.kPrimary
                                  : CustomColors.kGrey.withOpacity(0.3),
                              onPress: () {
                                setState(() {
                                  if (index == 0) {
                                    productCategory = ProductCategory.all;
                                  }
                                  if (index == 1) {
                                    productCategory = ProductCategory.women;
                                    productCategoryList = pc.allproductList!
                                        .where((element) =>
                                            element.productCategory ==
                                            ProductCategory.women)
                                        .toList();
                                  }
                                  if (index == 2) {
                                    productCategory = ProductCategory.men;
                                    productCategoryList = pc.allproductList!
                                        .where((element) =>
                                            element.productCategory ==
                                            ProductCategory.men)
                                        .toList();
                                  }
                                  if (index == 3) {
                                    productCategory = ProductCategory.kids;
                                    productCategoryList = pc.allproductList!
                                        .where((element) =>
                                            element.productCategory ==
                                            ProductCategory.kids)
                                        .toList();
                                  }
                                  selectedIndex = index;
                                });
                              },
                              title: categories[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 12.w);
                          },
                          itemCount: categories.length),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        children: [
                          Text(
                            'Most Popular',
                            style: CustomTextStyles.kBold20
                                .copyWith(color: CustomColors.kPrimary),
                          ),
                          const Spacer(),
                          listGridButton(
                            isView: isView,
                            onGridPress: () {
                              setState(() {
                                isView = !isView;
                              });
                            },
                            onListPress: () {
                              setState(() {
                                isView = !isView;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    isView
                        ? Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 28.h),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20.h,
                                );
                              },
                              itemCount: productCategory == ProductCategory.all
                                  ? pc.allproductList?.length ?? 0
                                  : productCategoryList?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductSaleCard(
                                  onTap: () {
                                    Get.to(() => DetailProductScreen(
                                        product: productCategory ==
                                                ProductCategory.all
                                            ? pc.allproductList![index]
                                            : productCategoryList![index]));
                                  },
                                  favoriteCallBack: () async {
                                    pc.savedProductsIds!.contains(
                                            pc.allproductList![index].productId)
                                        ? await pc.deletefromFavourite(
                                            product: productCategory ==
                                                    ProductCategory.all
                                                ? pc.allproductList![index]
                                                : productCategoryList![index])
                                        : await pc.addToFavourite(
                                            product: productCategory ==
                                                    ProductCategory.all
                                                ? pc.allproductList![index]
                                                : productCategoryList![index]);
                                  },
                                  isFavourite: pc.savedProductsIds!.contains(
                                          pc.allproductList![index].productId)
                                      ? CustomColors.kError
                                      : CustomColors.kDivider,
                                  product:
                                      productCategory == ProductCategory.all
                                          ? pc.allproductList![index]
                                          : productCategoryList![index],
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 28.w),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 156.w / 200.h,
                                        crossAxisSpacing: 25.h,
                                        mainAxisSpacing: 14.h),
                                itemCount:
                                    productCategory == ProductCategory.all
                                        ? pc.allproductList?.length ?? 0
                                        : productCategoryList?.length ?? 0,
                                itemBuilder: (BuildContext ctx, index) {
                                  return SaleCardGrid(
                                    onTap: () {
                                      Get.to(() => DetailProductScreen(
                                          product: productCategory ==
                                                  ProductCategory.all
                                              ? pc.allproductList![index]
                                              : productCategoryList![index]));
                                    },
                                    fovoriteCallBack: () async {
                                      pc.savedProductsIds!.contains(pc
                                              .allproductList![index].productId)
                                          ? await pc.deletefromFavourite(
                                              product: productCategory ==
                                                      ProductCategory.all
                                                  ? pc.allproductList![index]
                                                  : productCategoryList![index])
                                          : await pc.addToFavourite(
                                              product: productCategory ==
                                                      ProductCategory.all
                                                  ? pc.allproductList![index]
                                                  : productCategoryList![
                                                      index]);
                                    },
                                    isFavourite: pc.savedProductsIds!.contains(
                                            pc.allproductList![index].productId)
                                        ? CustomColors.kError
                                        : CustomColors.kDivider,
                                    product:
                                        productCategory == ProductCategory.all
                                            ? pc.allproductList![index]
                                            : productCategoryList![index],
                                  );
                                }),
                          )
                  ],
                );
        }));
  }
}
