import 'package:aimart_dev/app/modules/home/controllers/filter_controller.dart';
import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
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
  bool isFilter = false;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                setState(() {});
                isFilter = false;
                _search();
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
                  setState(() {
                    isFilter = true;
                    print(isFilter);
                  });
                },
              ),
            )
          ],
        ),
        SizedBox(height: 20.h),
        isFilter
            ? FutureBuilder<List<Product>?>(
                future: fc.getFilterProducts(
                    category: ProductCategory.men,
                    color: '0xFFFFFFFF', //show
                    price: 79,
                    sizes: 'L'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  List<Product> filterList = snapshot.data!;
                  print(filterList.length);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filterList.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return InkWell(
                          //show the problems
                          onTap: () {},
                          child: SizedBox(
                              height: 100.h,
                              width: Get.width,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        image: DecorationImage(
                                          image: NetworkImage(filterList[index]
                                              .productImages
                                              .first),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.h),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 28.h,
                                                    decoration: BoxDecoration(
                                                      color: filterList[index]
                                                                  .productTag ==
                                                              Tagtype.trending
                                                          ? CustomColors
                                                              .kTrendingBlue
                                                          : filterList[index]
                                                                      .productTag ==
                                                                  Tagtype
                                                                      .discount
                                                              ? CustomColors
                                                                  .kdarkred
                                                              : filterList[index]
                                                                          .productTag ==
                                                                      Tagtype
                                                                          .bestseller
                                                                  ? CustomColors
                                                                      .kgreen
                                                                  : CustomColors
                                                                      .knewblue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                12.w,
                                                                2.h,
                                                                12.w,
                                                                2.h),
                                                        child: Text(
                                                          filterList[index]
                                                              .productTag
                                                              .name
                                                              .toString(),
                                                          style: CustomTextStyles
                                                              .kBold12
                                                              .copyWith(
                                                                  color: CustomColors
                                                                      .kWhite),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  FavouriteButton(
                                                    onPressed: () {},
                                                    isFavourite:
                                                        CustomColors.kDivider,
                                                  ),
                                                ]),
                                            SizedBox(height: 11.h),
                                            Text(
                                              filterList[index].productName,
                                              style: CustomTextStyles.kBold12
                                                  .copyWith(
                                                      color: CustomColors
                                                          .kprimarylight),
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '\$${filterList[index].productPrice}',
                                                  style: CustomTextStyles
                                                      .kBold14
                                                      .copyWith(
                                                          color: CustomColors
                                                              .kbrandblue),
                                                ),
                                                SizedBox(width: 8.w),
                                                Text(
                                                  '\$${filterList[index].oldPrice}',
                                                  style: CustomTextStyles
                                                      .kMedium14
                                                      .copyWith(
                                                    color: CustomColors.kGrey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ])),
                        );
                      },
                    ),
                  );
                })
            : Expanded(
                child: _searching == true
                    ? Center(
                        child: Text(
                          "Searching, please wait...",
                          style: CustomTextStyles.kBold20,
                        ),
                      )
                    : _results.length == 0
                        ? Center(
                            child: Text(
                              "No results found.",
                              style: CustomTextStyles.kBold20,
                            ),
                          )
                        : ListView.builder(
                            itemCount: _results.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              AlgoliaObjectSnapshot snap = _results[index];
                              return InkWell(
                                onTap: () {},
                                child: SizedBox(
                                    height: 100.h,
                                    width: Get.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              image: DecorationImage(
                                                image: NetworkImage(snap
                                                    .data['productImages']
                                                    .first),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20.h),
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 28.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: snap.data[
                                                                        'productTag'] ==
                                                                    Tagtype
                                                                        .trending
                                                                ? CustomColors
                                                                    .kTrendingBlue
                                                                : snap.data['productTag'] ==
                                                                        Tagtype
                                                                            .discount
                                                                    ? CustomColors
                                                                        .kdarkred
                                                                    : snap.data['productTag'] ==
                                                                            Tagtype
                                                                                .bestseller
                                                                        ? CustomColors
                                                                            .kgreen
                                                                        : CustomColors
                                                                            .knewblue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.r),
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          12.w,
                                                                          2.h,
                                                                          12.w,
                                                                          2.h),
                                                              child: Text(
                                                                snap.data[
                                                                        'productTag']
                                                                    .toString(),
                                                                style: CustomTextStyles
                                                                    .kBold12
                                                                    .copyWith(
                                                                        color: CustomColors
                                                                            .kWhite),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        FavouriteButton(
                                                          onPressed: () {},
                                                          isFavourite:
                                                              CustomColors
                                                                  .kDivider,
                                                        ),
                                                      ]),
                                                  SizedBox(height: 11.h),
                                                  Text(
                                                    snap.data['productName'],
                                                    style: CustomTextStyles
                                                        .kBold12
                                                        .copyWith(
                                                            color: CustomColors
                                                                .kprimarylight),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '\$${snap.data['productPrice']}',
                                                        style: CustomTextStyles
                                                            .kBold14
                                                            .copyWith(
                                                                color: CustomColors
                                                                    .kbrandblue),
                                                      ),
                                                      SizedBox(width: 8.w),
                                                      Text(
                                                        '\$${snap.data['oldPrice']}',
                                                        style: CustomTextStyles
                                                            .kMedium14
                                                            .copyWith(
                                                          color: CustomColors
                                                              .kGrey,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ])),
                              );
                            },
                          ),
              )
      ]),
    ));
  }

  List<AlgoliaObjectSnapshot> _results = [];

  bool _searching = false;
  _search() async {
    setState(() {
      _searching = true;
    });
    AlgoliaQuery query = AlgoliaApplication.algolia.index('document');
    query = query.search(_searchController.text);
    _results = (await query.getObjects()).hits;
    setState(() {
      _searching = false;
    });
  }

  var algolia = AlgoliaApplication();
}

class AlgoliaApplication {
  static const Algolia algolia = Algolia.init(
    applicationId: 'TSBEHU8R8C',
    apiKey: 'a9d09b796f8d531b389b3511cb28de2d',
  );
}
