// import 'package:aimart_dev/app/data/helper/order_status.dart';
// import 'package:aimart_dev/app/modules/home/models/history_model.dart';
// import 'package:aimart_dev/app/modules/home/widgets/history/history_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PendingHistoryScreen extends StatelessWidget {
//   List<HistoryModel> pending = historyList
//       .where((element) => element.orderStatus == OrderStatus.pending)
//       .toList();

//   PendingHistoryScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         itemCount: pending.length,
//         padding: EdgeInsets.symmetric(horizontal: 28.w),
//         separatorBuilder: (context, index) => SizedBox(height: 32.h),
//         itemBuilder: (conext, index) {
//           return HistoryCard(
//             history: pending[index],
//           );
//         });
//   }
// }
