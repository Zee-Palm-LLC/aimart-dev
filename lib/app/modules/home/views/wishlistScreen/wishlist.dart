import 'package:aimart_dev/app/modules/home/views/home/home_screen.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/primary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/wishlist/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';
import '../../models/product_model.dart';
import '../../widgets/textfields/search_bar.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final TextEditingController _search = TextEditingController();
  int isFavourite = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: primaryAppbar(title: 'Wishlist Item'),
        body: Column(children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: SearchBar(
              controller: _search,
              hintText: 'Search id order in here..',
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 28.h),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
              itemCount: favouriteList.length,
              itemBuilder: (BuildContext context, int index) {
                return WishListCard(
                  product: favouriteList[index],
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
        ]));
  }
}
