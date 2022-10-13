// import 'package:aimart_dev/app/modules/home/widgets/home/custom_chips.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/item_in_grid_sale.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/item_in_list_sale.dart';
// import 'package:aimart_dev/app/modules/home/widgets/home/list_grid_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:aimart_dev/app/data/constants/constants.dart';
// import 'package:aimart_dev/app/modules/home/widgets/appbar/actions_appbar.dart';

// import 'package:aimart_dev/app/modules/home/widgets/home/cart_notification.dart';

// import '../../../../data/helper/product_category.dart';
// import '../../models/product_model.dart';
// import 'home_screen.dart';

// class HomeMostPopular extends StatefulWidget {
//   const HomeMostPopular({super.key});

//   @override
//   State<HomeMostPopular> createState() => _HomeMostPopularState();
// }

// class _HomeMostPopularState extends State<HomeMostPopular> {
//   @override
//   void initState() {
//     List<Product> allList = displayproduct; // TODO: implement initState
//     super.initState();
//   }

//   bool isView = false;

//   List<String> list = ['All', 'Woman', 'Men', 'Kids'];
//   int selectIndex = 0;
//   int isFavourite = -1;
//   List<Product> women = displayproduct
//       .where((element) => element.productCategory == ProductCategory.women)
//       .toList();
//   List<Product> men = displayproduct
//       .where((element) => element.productCategory == ProductCategory.men)
//       .toList();
//   List<Product> kids = displayproduct
//       .where((element) => element.productCategory == ProductCategory.kids)
//       .toList();
//   ProductCategory productCategory = ProductCategory.all;
//   List<Product> dataList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: actionsAppbar(title: 'Home', actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.search,
//               color: CustomColors.kDarkBblue,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 28.w, left: 14.w),
//             child: CartNotificationButton(
//               onPressed: () {},
//               isNotification: true,
//             ),
//           ),
//         ]),
//         body: Column(children: [
//           SizedBox(
//             height: 42.h,
//             child: ListView.separated(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return CustomChips(
//                     textColor: selectIndex == index
//                         ? CustomColors.kWhite
//                         : CustomColors.kGrey,
//                     color: selectIndex == index
//                         ? CustomColors.kPrimary
//                         : CustomColors.kBackground,
//                     borderColor: selectIndex == index
//                         ? CustomColors.kPrimary
//                         : CustomColors.kGrey.withOpacity(0.3),
//                     onPress: () {
//                       setState(() {
//                         selectIndex = index;
//                         if (index == 0) {
//                           productCategory = ProductCategory.all;
//                           dataList = displayproduct;
//                         }

//                         if (index == 1) {
//                           productCategory = ProductCategory.women;
//                           dataList = women;
//                         }

//                         if (index == 2) {
//                           productCategory = ProductCategory.men;
//                           dataList = men;
//                         }

//                         if (index == 3) {
//                           productCategory = ProductCategory.kids;
//                           dataList = kids;
//                         }
//                       });
//                     },
//                     title: list[index],
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return SizedBox(
//                     width: 14.w,
//                   );
//                 },
//                 itemCount: 4),
//           ),
//           SizedBox(height: 16.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 28.w),
//             child: Row(
//               children: [
//                 Text(
//                   'Most Popular',
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
//                     itemCount: dataList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ItemInListSale(
//                         product: dataList[index],
//                         onPressed: () {
//                           favouriteList.contains(dataList[index])
//                               ? favouriteList.remove(dataList[index])
//                               : favouriteList.add(dataList[index]);
//                           setState(() {});
//                         },
//                         isFavourite: favouriteList.contains(dataList[index])
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
//                       itemCount: dataList.length,
//                       itemBuilder: (BuildContext ctx, index) {
//                         return ItemInGridSale(
//                           product: dataList[index],
//                           onPressed: () {
//                             favouriteList.contains(dataList[index])
//                                 ? favouriteList.remove(dataList[index])
//                                 : favouriteList.add(dataList[index]);
//                             setState(() {});
//                           },
//                           isFavourite: favouriteList.contains(dataList[index])
//                               ? CustomColors.kError
//                               : CustomColors.kDivider,
//                         );
//                       }),
//                 )
//         ]));
//   }
// }
