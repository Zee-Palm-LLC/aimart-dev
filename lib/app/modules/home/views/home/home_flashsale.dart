import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

import '../../models/product_model.dart';
import '../../widgets/appbar/actions_appbar.dart';
import '../../widgets/home/cart_notification.dart';
import '../../widgets/home/item_in_grid_sale.dart';
import '../../widgets/home/item_in_list_sale.dart';
import '../../widgets/home/list_grid_button.dart';
import 'home_screen.dart';

class HomeFlashSale extends StatefulWidget {
  const HomeFlashSale({super.key});

  @override
  State<HomeFlashSale> createState() => _HomeFlashSaleState();
}

class _HomeFlashSaleState extends State<HomeFlashSale> {
  bool isView = false;
  int isFavourite = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: actionsAppbar(title: 'Home', actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: CustomColors.kDarkBblue,
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
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                Text(
                  'Flash Sale',
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
          ),
          SizedBox(
            height: 16.h,
          ),
          isView
              ? Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 28.h),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemInListSale(
                        product: products[index],
                        onPressed: () {
                          favouriteList.contains(products[index])
                              ? favouriteList.remove(products[index])
                              : favouriteList.add(products[index]);
                          setState(() {});
                        },
                        isFavourite: favouriteList.contains(products[index])
                            ? CustomColors.kError
                            : CustomColors.kDivider,
                      );
                    },
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 156.w / 200.h,
                          crossAxisSpacing: 25.h,
                          mainAxisSpacing: 14.h),
                      itemCount: products.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemInGridSale(
                          product: products[index],
                          onPressed: () {
                            favouriteList.contains(products[index])
                                ? favouriteList.remove(products[index])
                                : favouriteList.add(products[index]);
                            setState(() {});
                          },
                          isFavourite: favouriteList.contains(products[index])
                              ? CustomColors.kError
                              : CustomColors.kDivider,
                        );
                      }),
                )
        ]));
  }
}
