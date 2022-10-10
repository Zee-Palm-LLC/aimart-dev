import 'package:aimart_dev/app/modules/home/models/history_model.dart';
import 'package:aimart_dev/app/modules/home/widgets/history/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStatus extends StatelessWidget {
  const AllStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: historyList.length,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        separatorBuilder: (context, index) => SizedBox(height: 32.h),
        itemBuilder: (conext, index) {
          return HistoryCard(
            history: historyList[index],
          );
        });
  }
}
