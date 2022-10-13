// import 'package:aimart_dev/app/modules/home/widgets/bottomSheet/bottom_sheet.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/custom_chips.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:aimart_dev/app/data/constants/constants.dart';
// import 'package:aimart_dev/app/modules/home/views/home/home_screen.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/custom_text_button.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/search_text_feild.dart';
// import 'package:get/get.dart';

// import '../../widgets/textfields/search_row.dart';

// class SearchScreen extends StatelessWidget {
//   SearchScreen({super.key});
//   var _searchController = TextEditingController();
//   List<String> recentSerach = [
//     "Dinner Suit",
//     'Slim Fit Modric',
//     "Blazzer Suit  Adnan"
//   ];
//   List<String> recomSerach = [
//     "Classic Fit Body",
//     'Classic Suit',
//     "Classic Blazzer",
//     "Classic Gromwell"
//   ];
//   List<String> list = [
//     'Woreq Suits',
//     'Gakuran Suzuran',
//     'Fit RJB',
//     'Blazer Modric'
//   ];
//   int selectIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 28.w),
//       child: Column(children: [
//         SizedBox(height: 20.h),
//         Row(
//           children: [
//             Expanded(
//                 child: CustomTextFormField(
//               controller: _searchController,
//               hintText: 'What are you looking for?',
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.done,
//             )),
//             SizedBox(
//               width: 12.w,
//             ),
//             SizedBox(
//               height: 48.h,
//               width: 48.w,
//               child: CustomElevatedButton(
//                 child: Center(
//                   child: SizedBox(
//                       height: 13.2.w,
//                       width: 11.47.w,
//                       child: SvgPicture.asset(CustomAssets.kfiltericon)),
//                 ),
//                 onPressed: () {
//                   showModalBottomSheet(
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.vertical(top: Radius.circular(24.r)),
//                       ),
//                       context: context,
//                       builder: (context) {
//                         return CustomBottomSheet();
//                       });
//                 },
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 32.h,
//         ),
//         Row(
//           children: [
//             Text(
//               'Recent Search',
//               style: CustomTextStyles.kBold20
//                   .copyWith(color: CustomColors.kPrimary),
//             ),
//             const Spacer(),
//             CustomTextButton(
//               text: 'Clear All',
//               onPressed: () {},
//             )
//           ],
//         ),
//         SizedBox(
//           height: 24.h,
//         ),
//         SizedBox(
//           height: 118.h,
//           width: 345.w,
//           child: ListView.separated(
//             physics: const NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.zero,
//             separatorBuilder: (BuildContext context, int index) {
//               return SizedBox(
//                 height: 15.h,
//               );
//             },
//             itemCount: recentSerach.length,
//             itemBuilder: (BuildContext context, int index) {
//               return SearchRow(
//                 text: recentSerach[index],
//                 onClearPressed: () {},
//                 svg: CustomAssets.ktimesearch,
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           height: 24.h,
//         ),
//         Row(
//           children: [
//             Text(
//               'Trending Search',
//               style: CustomTextStyles.kBold20
//                   .copyWith(color: CustomColors.kPrimary),
//             ),
//             const Spacer(),
//             CustomTextButton(
//               text: 'Clear All',
//               onPressed: () {},
//             )
//           ],
//         ),
//         SizedBox(height: 24.h),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Wrap(
//               spacing: 5,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.start,
//               children: [
//                 CustomChips(
//                   textColor: CustomColors.kprimarylight,
//                   color: Colors.transparent,
//                   borderColor: CustomColors.kGrey.withOpacity(0.3),
//                   onPress: () {},
//                   title: list[0],
//                 ),
//                 CustomChips(
//                   textColor: CustomColors.kprimarylight,
//                   color: Colors.transparent,
//                   borderColor: CustomColors.kGrey.withOpacity(0.3),
//                   onPress: () {},
//                   title: list[1],
//                 ),
//                 CustomChips(
//                   textColor: CustomColors.kprimarylight,
//                   color: Colors.transparent,
//                   borderColor: CustomColors.kGrey.withOpacity(0.3),
//                   onPress: () {},
//                   title: list[2],
//                 ),
//                 CustomChips(
//                   textColor: CustomColors.kprimarylight,
//                   color: Colors.transparent,
//                   borderColor: CustomColors.kGrey.withOpacity(0.3),
//                   onPress: () {},
//                   title: list[3],
//                 )
//               ]),
//         ),
//       ]),
//     ));
//   }
// }
