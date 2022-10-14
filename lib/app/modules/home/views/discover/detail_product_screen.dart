import 'package:aimart_dev/app/modules/home/controllers/cart_controller.dart';
import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/discover/detail_product.dart';
import '../cart/cart_screen.dart';

class DetailProductScreen extends StatefulWidget {
  Product product;
  DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  CartController cartController = Get.find<CartController>();
  PageController controller = PageController();
  int sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: defaultOverlay,
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        children: [
          Container(
            height: 335.h,
            width: Get.width,
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
              scrollDirection: Axis.horizontal,
              itemCount: widget.product.productImages.length,
              itemBuilder: (context, myIndex) {
                return CustomDetailProduct(
                  product: widget.product,
                  currentIndex: myIndex,
                  controller: controller,
                );
              },
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            widget.product.productName,
            style: CustomTextStyles.kBold20
                .copyWith(color: CustomColors.kDarkBblue),
          ),
          SizedBox(height: 5.h),
          Text(widget.product.productType, style: CustomTextStyles.kMedium16),
          SizedBox(height: 33.h),
          Text('Size :',
              style: CustomTextStyles.kBold20
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 12.h),
          SizedBox(
            height: 42.h,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.product.sizes.length,
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
                        widget.product.sizes[index],
                        style: CustomTextStyles.kMedium12.copyWith(
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
          SizedBox(height: 33.h),
          Text('Description',
              style: CustomTextStyles.kBold20
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(height: 12.h),
          Text(widget.product.description,
              style: CustomTextStyles.kMedium12
                  .copyWith(color: CustomColors.kGrey)),
          SizedBox(height: 32.h),
          Text('Review',
              style: CustomTextStyles.kBold20
                  .copyWith(color: CustomColors.kDarkBblue)),
          SizedBox(width: 6.w),
          Row(
            children: [
              Icon(Icons.star, color: CustomColors.kGolden),
              SizedBox(width: 6.w),
              Text(
                widget.product.rating?.averageRating.toString() ?? '0.0',
                style: CustomTextStyles.kMedium16,
              ),
              SizedBox(width: 6.w),
              Text(
                '( ${widget.product.rating?.totalRating ?? 0} Review)',
                style: CustomTextStyles.kMedium16,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // ListView.builder(
          //     itemCount: 2,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           CircleAvatar(
          //             backgroundImage: AssetImage(CustomAssets.kprofilepic),
          //           ),
          //           SizedBox(width: 10.w),
          //           Column(
          //             children: [],
          //           )
          //         ],
          //       );
          //     }),
          PrimaryButton(
            onPressed: () {},
            color: CustomColors.kfullWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View All Review',
                  style: CustomTextStyles.kMedium12
                      .copyWith(color: CustomColors.kGrey),
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16.sp,
                  color: CustomColors.kGrey,
                )
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        width: Get.width,
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
                  cartController.addtoCart(
                  cart: CartModel(cartItemModel: [CartItemModel(product: widget.product, quantity: 1)] ));

                 
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
