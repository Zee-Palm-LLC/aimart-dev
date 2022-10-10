import 'package:aimart_dev/app/modules/home/views/checkout/card_payment.dart';
import 'package:aimart_dev/app/modules/home/views/checkout/selectpayment_method.dart';
import 'package:aimart_dev/app/modules/home/views/checkout/shipping_address.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/secondary_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../controllers/page_controller.dart';
import '../../widgets/appbar/stepper_appbar.dart';
import '../../widgets/checkout/stepper.dart';

class CheckOutScreenController extends GetView<PagesController> {
  List<Widget> pages = [
    const SelectPaymentMethod(),
    ShippingAddress(),
    CardPaymentScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetX<PagesController>(
        init: PagesController(),
        builder: (statusController) {
          return WillPopScope(
            onWillPop: () async {
              if (statusController.initialPageIndex == 0) {
                Get.delete<PagesController>();

                Get.back();
              } else {
                statusController.updateStatus(
                    statusController.initialPageIndex, false);

                await statusController.animateInitialPageToPrevious();
              }
              return false;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: (statusController.initialPageIndex == 0)
                  ? secondaryAppbar(title: 'Checkout')
                  : customAppBarStepper(),
              body: Column(
                children: [
                  SizedBox(height: 10.h),
                  Container(
                      height: 64.h,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 33.w),
                      color: CustomColors.kDivider,
                      child: Center(
                          child: StepperWidget(
                              statuses: statusController.statusesValue))),
                  Expanded(
                    child: PageView.builder(
                      controller: statusController.initialScreenController,
                      itemBuilder: (BuildContext context, int index) {
                        return pages[index];
                      },
                      itemCount: pages.length,
                      onPageChanged: (int index) {
                        // statusController.updateInitialIndex(index);
                        statusController.updateStatus(index, true);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
