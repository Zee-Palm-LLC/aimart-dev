import 'package:aimart_dev/app/modules/home/controllers/filter_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_dev/app/modules/home/views/discover/detail_product_screen.dart';
import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:get/get.dart';

import '../../../../data/helper/product_category.dart';
import '../../models/product_model.dart';
import '../../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ProductController pc = Get.find<ProductController>();
  FilterController fc = Get.find<FilterController>();
  int selectIndex = 0;

  TextEditingController _searchController = TextEditingController();
  ProductCategory selectedCategory = ProductCategory.all;
  RxString filterColor = ''.obs;
  RxString filterSize = ''.obs;
  RxDouble filterPrice = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 28.w),
        child: Column(children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                  child: CustomTextFormField(
                controller: _searchController,
                isPasswordField: false,
                validator: (value) {},
                onChange: (value) {
                  _search();
                  setState(() {});
                },
                hintText: 'What are you looking for?',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              )),
              SizedBox(width: 12.w),
              SizedBox(
                height: 48.h,
                width: 48.w,
                child: PrimaryButton(
                  child: SvgPicture.asset(CustomAssets.kfiltericon),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24.r)),
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
          SizedBox(height: 20.h),
          Expanded(
            child: fc.searching == true
                ? Center(
                    child: Text("Searching, please wait...",
                        style: CustomTextStyles.kBold20))
                : _results.isEmpty
                    ? Center(
                        child: Text("No results found.",
                            style: CustomTextStyles.kBold20))
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: _results.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Product snap = Product.fromAlgolia(_results[index]);
                          return ProductSaleCard(
                            onTap: () {
                              Get.to(() => DetailProductScreen(product: snap));
                            },
                            favoriteCallBack: () {},
                            isFavourite: CustomColors.kDivider,
                            product: snap,
                          );
                        },
                      ),
          )
        ]),
      ));
    });
  }

  List<AlgoliaObjectSnapshot> _results = [];

  _search() async {
    fc.setSearch = false;
    AlgoliaQuery query = AlgoliaApplication.algolia
        .index('document')
        .query(_searchController.text)
        .setOffset(0)
        .setHitsPerPage(25);
    _results = (await query.getObjects()).hits;
  }

  var algolia = AlgoliaApplication();
}

class AlgoliaApplication {
  static const Algolia algolia = Algolia.init(
    applicationId: 'TSBEHU8R8C',
    apiKey: 'a9d09b796f8d531b389b3511cb28de2d',
  );
}
