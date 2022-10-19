import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/views/discover/detail_product_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/home/sale_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../widgets/widgets.dart';

class HomeFlashSale extends StatefulWidget {
  const HomeFlashSale({super.key});

  @override
  State<HomeFlashSale> createState() => _HomeFlashSaleState();
}

class _HomeFlashSaleState extends State<HomeFlashSale> {
  bool isView = false;
  int isFavorite = -1;
  ProductController pc = Get.find<ProductController>();
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
        body: StreamBuilder<List<Product>>(
            stream: pc.getDiscountedItems(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'No Sale Products',
                    style: CustomTextStyles.kBold20,
                  ),
                );
              }
              List<Product>? saleItems = snapshot.data;
              return Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Flash Sale',
                          style: CustomTextStyles.kBold20
                              .copyWith(color: CustomColors.kprimarylight)),
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
                ),
                SizedBox(height: 16.h),
                isView
                    ? Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 28.h),
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemCount: saleItems?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductSaleCard(
                              onTap: () {
                                Get.to(() => DetailProductScreen(
                                    product: saleItems![index]));
                              },
                              product: saleItems![index],
                              favoriteCallBack: () async {
                                pc.savedProductsIds!.contains(
                                        pc.allproductList![index].productId)
                                    ? await pc.deletefromFavourite(
                                        product: saleItems[index])
                                    : await pc.addToFavourite(
                                        product: saleItems[index]);
                              },
                              isFavourite: pc.savedProductsIds!.contains(
                                      pc.allproductList![index].productId)
                                  ? CustomColors.kError
                                  : CustomColors.kDivider,
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
                            itemCount: saleItems?.length ?? 0,
                            itemBuilder: (BuildContext ctx, index) {
                              return SaleCardGrid(
                                onTap: () {
                                  Get.to(() => DetailProductScreen(
                                      product: saleItems![index]));
                                },
                                product: saleItems![index],
                                fovoriteCallBack: () async {
                                  pc.savedProductsIds!
                                          .contains(saleItems[index].productId)
                                      ? await pc.deletefromFavourite(
                                          product: saleItems[index])
                                      : await pc.addToFavourite(
                                          product: saleItems[index]);
                                },
                                isFavourite: pc.savedProductsIds!
                                        .contains(saleItems[index].productId)
                                    ? CustomColors.kError
                                    : CustomColors.kDivider,
                              );
                            }),
                      )
              ]);
            }));
  }
}
