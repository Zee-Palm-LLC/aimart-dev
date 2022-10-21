// import 'package:aimart_dev/app/modules/home/widgets/notification.dart/notification_list_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:aimart_dev/app/data/constants/constants.dart';

// import 'package:aimart_dev/app/modules/home/widgets/appbar/actions_appbar.dart';

// import '../../models/notification_model.dart';

// class NotificationScreen extends StatelessWidget {
//   NotificationScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: actionsAppbar(title: 'Notifications', actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 28.w, top: 23.h),
//             child: Text(
//               '2  Newest',
//               style: CustomTextStyles.kMedium12
//                   .copyWith(color: CustomColors.kError),
//             ),
//           ),
//         ]),
//         body: ListView.separated(
//             itemBuilder: (BuildContext context, int index) {
//               return NotificationListView(
//                   notifications: notificationList[index]);
//             },
//             itemCount: notificationList.length,
//             separatorBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: EdgeInsets.only(left: 28.w, right: 28.w),
//                 child: const Divider(),
//               );
//             }));
//   }
// }
