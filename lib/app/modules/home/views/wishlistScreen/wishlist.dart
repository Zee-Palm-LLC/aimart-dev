import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/primary_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';

import '../../controllers/product_controller.dart';
import '../../widgets/textfields/search_bar.dart';
import '../../widgets/widgets.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final TextEditingController _search = TextEditingController();
  ProductController pc = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: primaryAppbar(title: 'Wishlist Item'),
        body: Obx(() {
          return pc.savedProducts.isEmpty
              ? Center(
                  child: Text(
                    'No Favorite List',
                    style: CustomTextStyles.kBold20,
                  ),
                )
              : Column(children: [
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
                      itemCount: pc.savedProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WishListCard(
                            product: pc.savedProducts[index],
                            onPressed: () async {
                              await pc.deleteFromFavorite(
                                  product: pc.savedProducts[index]);
                            },
                            isFavourite: CustomColors.kError);
                      },
                    ),
                  )
                ]);
        }));
  }
}
