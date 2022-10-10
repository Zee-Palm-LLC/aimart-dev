import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../../widgets/onboarding/onboarding_card.dart';
import '../auth/login_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kWhite,
      body: Column(
        children: [
          SizedBox(
            height: 770.h,
            child: PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: onBoardinglist.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingWidget(
                  onBoarding: onBoardinglist[index],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: onBoardinglist.length,
                  effect: ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 2.0,
                      dotWidth: 14.0,
                      dotHeight: 3.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 0.5,
                      dotColor: CustomColors.kGrey2,
                      activeDotColor: Colors.indigo),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 64.w),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          minimumSize: Size(173.w, 50.h),
                          primary: CustomColors.kPrimary),
                      onPressed: () {
                        if (currentIndex == 2) {
                          Get.offAll(
                            () => LoginScreen(),
                          );
                        } else {
                          currentIndex++;
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);

                          setState(() {});
                        }
                      },
                      child: currentIndex == 2
                          ? const Text('Get Started')
                          : const Text('Next')),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
