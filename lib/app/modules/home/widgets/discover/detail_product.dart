import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/constants/assets.dart';
import '../../../../data/constants/color.dart';

class CustomDetailProduct extends StatefulWidget {
  int currentIndex;
  final PageController controller;
  CustomDetailProduct({
    Key? key,
    required this.controller,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomDetailProduct> createState() => _CustomDetailProductState();
}

class _CustomDetailProductState extends State<CustomDetailProduct> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 315.w,
          child: SvgPicture.asset(
            CustomAssets.kImage,
            color: CustomColors.kShirtsColor[widget.currentIndex],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 310.h),
          child: AnimatedSmoothIndicator(
            activeIndex: widget.currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
                spacing: 8.0,
                radius: 2.0,
                dotWidth: 14.0,
                dotHeight: 3.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 0.7,
                dotColor: CustomColors.kfullWhite,
                activeDotColor: Colors.indigo),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 255.w, top: 25.h),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.kFavDiscountButton,
            ),
            child: Center(
              child: SvgPicture.asset(
                CustomAssets.kHeart,
                height: 25,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 220.w, top: 130.h),
          child: SizedBox(
            height: 200.h,
            width: 100,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      widget.controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                      if (widget.currentIndex == 0) {
                        widget.controller.jumpToPage(index);
                      }
                      if (widget.currentIndex == 1) {
                        widget.controller.jumpToPage(index);
                      }
                      if (widget.currentIndex == 2) {
                        widget.controller.jumpToPage(index);
                      }
                      setState(() {});
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.kShirtsColor[index],
                      ),
                      child: Center(
                        child: widget.currentIndex == index
                            ? Icon(
                                Icons.done,
                                size: 18,
                                color: CustomColors.kfullWhite,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
