// ignore_for_file: prefer_final_fields

import 'package:aimart_dev/app/modules/home/controllers/filter_controller.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../../../data/constants/constants.dart';
import '../../../../data/helper/product_category.dart';
import '../widgets.dart';

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  RxDouble _value = 0.0.obs;
  double get sliderValue => _value.value;
  RxInt _selectedColor = 0.obs;
  int get selectedColor => _selectedColor.value;
  RxInt _selectedSize = 0.obs;
  int get selectedSize => _selectedSize.value;
  RxInt _defaultCategoryIndex = 0.obs;
  int get defaultCategoryIndex => _defaultCategoryIndex.value;
  Rx<ProductCategory> _selectedCategory = ProductCategory.all.obs;
  ProductCategory get selectedCategory => _selectedCategory.value;
  RxInt _selectedCategoryIndex = 0.obs;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;
  FilterController fc = Get.find<FilterController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => FractionallySizedBox(
          heightFactor: 1.5,
          child: Container(
            color: CustomColors.kWhite,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Center(
                    child: Container(
                      height: 4.h,
                      width: 94.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: CustomColors.kGrey),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Filter Search',
                      style: CustomTextStyles.kBold20
                          .copyWith(color: CustomColors.kprimarylight),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Type :',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kprimarylight),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomChips(
                              textColor: selectedCategoryIndex ==
                                      ProductCategory.values[index].index
                                  ? CustomColors.kWhite
                                  : CustomColors.kGrey,
                              color: selectedCategoryIndex ==
                                      ProductCategory.values[index].index
                                  ? CustomColors.kPrimary
                                  : CustomColors.kBackground,
                              borderColor: selectedCategoryIndex ==
                                      ProductCategory.values[index].index
                                  ? CustomColors.kPrimary
                                  : CustomColors.kGrey.withOpacity(0.3),
                              onPress: () {
                                _selectedCategory.value =
                                    ProductCategory.values[index];
                                _selectedCategoryIndex.value = index;
                                print(selectedCategoryIndex);
                                print(selectedCategory.toString());
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
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Size :',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kprimarylight),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Wrap(
                        spacing: 16,
                        children: List.generate(size.length, (index) {
                          return InkWell(
                              onTap: () {
                                _selectedSize.value = index;
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.all(8.h),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedSize == index
                                        ? CustomColors.kbrandblue
                                        : Colors.transparent,

                                    //borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: selectedSize == index
                                            ? CustomColors.kbrandblue
                                            : CustomColors.kGrey)),
                                child: Center(
                                  child: Text(
                                    size[index],
                                    style: CustomTextStyles.kBold12.copyWith(
                                        color: selectedSize == index
                                            ? CustomColors.kWhite
                                            : CustomColors.kGrey),
                                  ),
                                ),
                              ));
                        }),
                      )),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Price :',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kprimarylight),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          '\$0.0',
                          style: CustomTextStyles.kBold12
                              .copyWith(color: CustomColors.kprimarylight),
                        ),
                        const Spacer(),
                        Text(
                          '\$199.00',
                          style: CustomTextStyles.kBold12
                              .copyWith(color: CustomColors.kprimarylight),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Builder(builder: (context) {
                      return Slider(
                        activeColor: CustomColors.kbrandblue,
                        inactiveColor: CustomColors.kGrey,
                        thumbColor: CustomColors.kbrandblue,
                        min: 0,
                        max: 200,
                        value: _value.value,
                        onChanged: (value) {
                          _value.value = value;
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Color :',
                      style: CustomTextStyles.kBold16
                          .copyWith(color: CustomColors.kprimarylight),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Wrap(
                      spacing: 20.w,
                      runSpacing: 12.h,
                      children: List.generate(5, (index) {
                        return SizedBox(
                          height: 40.h,
                          width: 89.w,
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                              side: BorderSide(
                                color: defaultCategoryIndex == index
                                    ? CustomColors.kWhite
                                    : CustomColors.kGrey,
                              ),
                            ),
                            disabledColor: Colors.white,
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 6.r,
                                  backgroundColor:
                                      Color(int.parse(color[index])),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  colorNames[index],
                                  style: CustomTextStyles.kBold14.copyWith(
                                      color: defaultCategoryIndex == index
                                          ? CustomColors.kWhite
                                          : CustomColors.kGrey),
                                ),
                              ],
                            ),
                            selected: defaultCategoryIndex == index,
                            selectedColor: CustomColors.kbrandblue,
                            onSelected: (value) {
                              _defaultCategoryIndex.value =
                                  value ? index : defaultCategoryIndex;
                            },
                            backgroundColor: Colors.white,
                            elevation: 1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                        onPressed: () {
                          Get.back();
                          fc.setSearchItem = Product(
                              productId: '',
                              productName: '',
                              productType: '',
                              productPrice: sliderValue.toInt(),
                              productCategory: selectedCategory,
                              productImages: [],
                              productTag: Tagtype.discount,
                              description: '',
                              colors: [colorNames[selectedColor]],
                              sizes: [size[selectedSize]]);
                          fc.setFilter = true;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Show Filter',
                              style: CustomTextStyles.kBold16
                                  .copyWith(color: CustomColors.kWhite),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.arrow_forward_sharp,
                                color: CustomColors.kWhite)
                          ],
                        )),
                  )
                ]),
          ),
        ));
  }
}

List<String> colorNames = ['White', 'Red', 'Green', 'Black', 'Blue'];
List<String> size = ['XXL', 'XL', 'L', 'M', 'S'];
List<String> color = [
  '0xFFFFFFFF',
  '0xFFFF0000',
  '0xFF00FF00',
  '0xFF000000',
  '0xFF0000FF',
];
