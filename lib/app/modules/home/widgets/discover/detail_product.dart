import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomDetailProduct extends StatefulWidget {
  int currentIndex;
  final PageController controller;
  final Product product;
  CustomDetailProduct({
    Key? key,
    required this.product,
    required this.controller,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomDetailProduct> createState() => _CustomDetailProductState();
}

class _CustomDetailProductState extends State<CustomDetailProduct> {
  int selectIndex = 0;
  ProductController pc = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335.h,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  widget.product.productImages[widget.currentIndex]),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavouriteButton(
                  onPressed: () async {
                    pc.savedProductsIds!.contains(widget.product.productId)
                        ? await pc.deleteFromFavorite(product: widget.product)
                        : await pc.addToFavorite(product: widget.product);
                    setState(() {});
                  },
                  isFavourite:
                      pc.savedProductsIds!.contains(widget.product.productId)
                          ? CustomColors.kError
                          : CustomColors.kDivider)
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AnimatedSmoothIndicator(
          //       activeIndex: widget.currentIndex,
          //       count: widget.product.colors.length,
          //       effect: ExpandingDotsEffect(
          //           spacing: 8.0,
          //           radius: 2.0,
          //           dotWidth: 14.0,
          //           dotHeight: 3.0,
          //           paintStyle: PaintingStyle.fill,
          //           strokeWidth: 0.7,
          //           dotColor: CustomColors.kfullWhite,
          //           activeDotColor: Colors.indigo),
          //     ),
          //     ...List.generate(
          //         widget.product.colors.length,
          //         (index) => InkWell(
          //               onTap: () {
          //                 widget.controller.nextPage(
          //                     duration: const Duration(milliseconds: 500),
          //                     curve: Curves.ease);
          //                 if (widget.currentIndex == 0) {
          //                   widget.controller.jumpToPage(index);
          //                 }
          //                 if (widget.currentIndex == 1) {
          //                   widget.controller.jumpToPage(index);
          //                 }
          //                 if (widget.currentIndex == 2) {
          //                   widget.controller.jumpToPage(index);
          //                 }
          //                 setState(() {});
          //               },
          //               child: Container(
          //                 width: 34.w,
          //                 height: 34.h,
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   color: CustomColors.kShirtsColor[index],
          //                 ),
          //                 child: Center(
          //                   child: widget.currentIndex == index
          //                       ? Icon(
          //                           Icons.done,
          //                           size: 18,
          //                           color: CustomColors.kfullWhite,
          //                         )
          //                       : const SizedBox(),
          //                 ),
          //               ),
          //             ))
          //   ],
          // )
        ],
      ),
    );
  }
}

//     Padding(
//       padding: EdgeInsets.only(left: 220.w, top: 130.h),
//       child: SizedBox(
//         height: 200.h,
//         width: 100,
//         child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ,
//             );
//           },
//         ),
//       ),
//     )
//   ],
// )
