import 'package:aimart_dev/app/modules/home/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../../../data/helper/order_status.dart';
import '../global/status_widget.dart';

class HistoryCard extends StatelessWidget {
  HistoryModel history;
  HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: Get.width,
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: AssetImage(history.product.productImage ?? ''),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.product.productName ?? '',
                  style: CustomTextStyles.kBold14
                      .copyWith(color: CustomColors.kDarkBblue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Blazzer . Black . L . Qty 1",
                      style: CustomTextStyles.kMedium12
                          .copyWith(color: CustomColors.kGrey),
                    ),
                    Text(
                      "\$ ${history.product.productPrize}",
                      style: CustomTextStyles.kMedium14.copyWith(
                          color: CustomColors.kPrimary,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      history.orderId,
                      style: CustomTextStyles.kMedium12
                          .copyWith(color: CustomColors.kGrey),
                    ),
                    StatusWidget(
                        bgColor: history.orderStatus == OrderStatus.received
                            ? CustomColors.kGreen.withOpacity(0.20)
                            : history.orderStatus == OrderStatus.cancel
                                ? CustomColors.kError.withOpacity(0.20)
                                : history.orderStatus == OrderStatus.waiting
                                    ? CustomColors.kPrimary.withOpacity(0.05)
                                    : history.orderStatus ==
                                            OrderStatus.delivery
                                        ? CustomColors.kGolden.withOpacity(0.2)
                                        : history.orderStatus ==
                                                OrderStatus.pending
                                            ? Colors.pink.withOpacity(0.05)
                                            : Colors.orange.shade100,
                        textColor: history.orderStatus == OrderStatus.received
                            ? CustomColors.kGreen
                            : history.orderStatus == OrderStatus.cancel
                                ? CustomColors.kError
                                : history.orderStatus == OrderStatus.waiting
                                    ? CustomColors.kPrimary
                                    : history.orderStatus ==
                                            OrderStatus.delivery
                                        ? CustomColors.kGolden
                                        : history.orderStatus ==
                                                OrderStatus.pending
                                            ? Colors.pink
                                            : Colors.orange,
                        text:
                            history.orderStatus.name.capitalizeFirst.toString())
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
