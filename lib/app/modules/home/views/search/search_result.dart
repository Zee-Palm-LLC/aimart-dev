
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:aimart_dev/app/data/constants/constants.dart';
// import 'package:aimart_dev/app/modules/home/widgets/appbar/actions_appbar.dart';

// import 'package:aimart_dev/app/modules/home/widgets/home/cart_notification.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';


// class SearchResultScreen extends StatefulWidget {
//   const SearchResultScreen({super.key});

//   @override
//   State<SearchResultScreen> createState() => _SearchResultScreenState();
// }

// class _SearchResultScreenState extends State<SearchResultScreen> {
//   bool isView = false;
//   int isFavourite = -1;
//   var _searchController = TextEditingController();
//   double _value = 0;
//   int defaultChoiceIndex = 0;
//   List<String> _size = ['XXL', 'XL', 'L', 'M', 'S'];
//   List<String> list = ['Woman', 'Men', 'Kids'];
//   int selectIndex = 0;
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: actionsAppbar(title: 'Search Result', actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 28.w, left: 14.w),
//             child: CartNotificationButton(
//               onPressed: () {},
//               isNotification: true,
//             ),
//           ),
//         ]),
//         body: Column(children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 28.w),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: CustomTextFormField(
//                   controller: _searchController,
//                   hintText: 'Classic Fit',
//                   keyboardType: TextInputType.text,
//                   textInputAction: TextInputAction.done,
//                 )),
//                 SizedBox(
//                   width: 12.w,
//                 ),
//                 SizedBox(
//                   height: 48.h,
//                   width: 48.w,
//                   child: CustomElevatedButton(
//                     child: Center(
//                       child: SizedBox(
//                           height: 13.2.w,
//                           width: 11.47.w,
//                           child: SvgPicture.asset(CustomAssets.kfiltericon)),
//                     ),
//                     onPressed: () {
//                       Get.bottomSheet(CustomBottomSheet());
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 32.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 28.w),
//             child: Row(
//               children: [
//                 Text(
//                   '127 Results',
//                   style: CustomTextStyles.kBold20
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//                 const Spacer(),
//                 listGridButton(
//                   isView: isView,
//                   onGridPress: () {
//                     setState(() {
//                       isView = !isView;
//                     });
//                   },
//                   onListPress: () {
//                     setState(() {
//                       isView = !isView;
//                     });
//                   },
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 16.h,
//           ),
//           isView
//               ? Expanded(
//                   child: ListView.separated(
//                     padding: EdgeInsets.symmetric(horizontal: 28.h),
//                     separatorBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                         height: 20.h,
//                       );
//                     },
//                     itemCount: products.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ItemInListSale(
//                         product: products[index],
//                         onPressed: () {
//                           setState(() {
//                             isFavourite = index;
//                           });
//                         },
//                         isFavourite: isFavourite == index
//                             ? CustomColors.kError
//                             : CustomColors.kDivider,
//                       );
//                     },
//                   ),
//                 )
//               : Expanded(
//                   child: GridView.builder(
//                       padding: EdgeInsets.symmetric(horizontal: 28.w),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 156.w / 200.h,
//                           crossAxisSpacing: 25.h,
//                           mainAxisSpacing: 14.h),
//                       itemCount: products.length,
//                       itemBuilder: (BuildContext ctx, index) {
//                         return ItemInGridSale(
//                           product: products[index],
//                           onPressed: () {
//                             setState(() {
//                               isFavourite = index;
//                             });
//                           },
//                           isFavourite: isFavourite == index
//                               ? CustomColors.kError
//                               : CustomColors.kDivider,
//                         );
//                       }),
//                 )
//         ]));
//   }
// }
