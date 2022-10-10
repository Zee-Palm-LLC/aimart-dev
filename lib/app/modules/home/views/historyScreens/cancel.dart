import 'package:aimart_dev/app/data/helper/order_status.dart';
import 'package:aimart_dev/app/modules/home/models/history_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/history/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelHistoryScreen extends StatelessWidget {
  List<HistoryModel> cancel = historyList
      .where((element) => element.orderStatus == OrderStatus.cancel)
      .toList();

  CancelHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: cancel.length,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        separatorBuilder: (context, index) => SizedBox(height: 32.h),
        itemBuilder: (conext, index) {
          return HistoryCard(
            history: cancel[index],
          );
        });
  }
}
