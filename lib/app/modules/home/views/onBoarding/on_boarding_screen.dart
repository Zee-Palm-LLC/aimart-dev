import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:aimart_dev/app/data/constants/constants.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: defaultOverlay,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 670.h,
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
                  index: index,
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSmoothIndicator(
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
                ElevatedButton(
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
                        ? Text('Get Started', style: CustomTextStyles.kMedium16)
                        : Text('Next', style: CustomTextStyles.kMedium16)),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
