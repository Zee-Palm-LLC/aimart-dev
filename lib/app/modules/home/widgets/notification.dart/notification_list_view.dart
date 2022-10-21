// import 'package:aimart_dev/app/data/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../models/notification_model.dart';

// class NotificationListView extends StatelessWidget {
//   final NotificationModel notifications;
//   const NotificationListView({
//     Key? key,
//     required this.notifications,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15.w, right: 14.w),
//       child: ListTile(
//         leading: Padding(
//           padding: EdgeInsets.only(top: 8.h),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 40.h,
//                       width: 40.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.r),
//                         image: DecorationImage(
//                           image: AssetImage(
//                             notifications.notificationtype ==
//                                     NotificationEnum.update
//                                 ? CustomAssets.notupdate
//                                 : notifications.notificationtype ==
//                                         NotificationEnum.discout
//                                     ? CustomAssets.knotdiscout
//                                     : notifications.notificationtype ==
//                                             NotificationEnum.payment
//                                         ? CustomAssets.notrecipt
//                                         : CustomAssets.notsuccess,
//                           ),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     )
//                   ]),
//               Positioned(
//                 top: 8,
//                 right: 0,
//                 child: notifications.isNotSeen
//                     ? Container(
//                         height: 12.h,
//                         width: 12.w,
//                         // padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.w),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: CustomColors.kError),
//                         alignment: Alignment.center,
//                       )
//                     : const SizedBox(),
//               ),
//             ],
//           ),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               notifications.title,
//               style: CustomTextStyles.kBold16.copyWith(
//                   color: notifications.isNotSeen
//                       ? CustomColors.kprimarylight
//                       : CustomColors.kprimary600),
//             ),
//             const Spacer(),
//             Text(
//               notifications.date,
//               style: CustomTextStyles.kMedium12.copyWith(
//                   color: notifications.isNotSeen
//                       ? CustomColors.kprimarylight
//                       : CustomColors.kprimary600),
//             ),
//           ],
//         ),
//         subtitle: SizedBox(
//           width: 259.w,
//           child: Text(
//             notifications.detail,
//             style: CustomTextStyles.kMedium12
//                 .copyWith(color: CustomColors.kprimary500)
//                 .copyWith(letterSpacing: 1.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
