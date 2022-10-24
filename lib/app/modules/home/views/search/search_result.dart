import 'package:aimart_dev/app/modules/home/views/discover/detail_product_screen.dart';
import 'package:aimart_dev/app/modules/home/views/search/search_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/sale_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/filter_controller.dart';
import '../../models/product_model.dart';
import '../../widgets/widgets.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool isView = false;
  int isFavourite = -1;
  var _searchController = TextEditingController();
  FilterController fc = Get.find<FilterController>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: actionsAppbar(title: 'Search Result', actions: [
          Padding(
            padding: EdgeInsets.only(right: 28.w, left: 14.w),
            child: CartNotificationButton(
              onPressed: () {},
              isNotification: true,
            ),
          ),
        ]),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: _searchController,
                  hintText: 'Search',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value) {},
                  isPasswordField: false,
                  onChange: (e) {},
                )),
                SizedBox(
                  width: 12.w,
                ),
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: PrimaryButton(
                    child: SvgPicture.asset(CustomAssets.kfiltericon),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24.r)),
                          ),
                          context: context,
                          builder: (context) {
                            return CustomBottomSheet();
                          });
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(height: 16.h),
          FutureBuilder<List<Product>?>(
              future: fc.getFilterProducts(
                  category: fc.searchItems!.productCategory,
                  color: fc.searchItems!.colors.first, //show
                  price: fc.searchItems!.productPrice,
                  sizes: fc.searchItems!.sizes.first),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Product>? filterList = snapshot.data ?? [];
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    children: [
                      Row(
                        children: [
                          Text(
                            '${filterList.length} Results',
                            style: CustomTextStyles.kBold20
                                .copyWith(color: CustomColors.kprimarylight),
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
                          )
                        ],
                      ),
                      isView
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 28.h),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20.h,
                                );
                              },
                              itemCount: filterList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductSaleCard(
                                  product: filterList[index],
                                  onTap: () {
                                    Get.to(() => DetailProductScreen(
                                        product: filterList[index]));
                                  },
                                  favoriteCallBack: () {},
                                  isFavourite: isFavourite == index
                                      ? CustomColors.kError
                                      : CustomColors.kDivider,
                                );
                              },
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 28.w),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 156.w / 200.h,
                                      crossAxisSpacing: 25.h,
                                      mainAxisSpacing: 14.h),
                              itemCount: filterList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return SaleCardGrid(
                                  product: filterList[index],
                                  fovoriteCallBack: () {},
                                  onTap: () {
                                    Get.to(() => DetailProductScreen(
                                        product: filterList[index]));
                                  },
                                  isFavourite: isFavourite == index
                                      ? CustomColors.kError
                                      : CustomColors.kDivider,
                                );
                              }),
                    ],
                  ),
                );
              })
        ]));
  }
}
