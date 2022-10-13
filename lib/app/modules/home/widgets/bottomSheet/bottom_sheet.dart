// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../data/constants/constants.dart';
// import '../../models/colormodel.dart';
// import '../../views/home/home_screen.dart';

// class CustomBottomSheet extends StatefulWidget {
//   const CustomBottomSheet({Key? key}) : super(key: key);

//   @override
//   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
// }

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   double _value = 0;
//   int defaultChoiceIndex = 0;
//   int defaultSizeIndex = 0;
//   int defaultCategoryIndex = 0;
//   List<String> _size = ['XXL', 'XL', 'L', 'M', 'S'];
//   List<String> list = ['Woman', 'Men', 'Kids'];
//   int selectIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 1.5,
//       child: Container(
//         color: CustomColors.kWhite,
//         child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 8.h),
//               Center(
//                 child: Container(
//                   height: 4.h,
//                   width: 94.w,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24.r),
//                       color: CustomColors.kGrey),
//                 ),
//               ),
//               SizedBox(height: 30.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Text(
//                   'Filter Search',
//                   style: CustomTextStyles.kBold20
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Text(
//                   'Type :',
//                   style: CustomTextStyles.kBold16
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Padding(
//                   padding: EdgeInsets.only(left: 20.w),
//                   child: Wrap(
//                     spacing: 16,
//                     children: List.generate(list.length, (index) {
//                       return InkWell(
//                           onTap: () {
//                             setState(() {
//                               defaultChoiceIndex == index;
//                             });
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 23.w, vertical: 10.h),
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 color: defaultChoiceIndex == index
//                                     ? CustomColors.kbrandblue
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                     color: defaultChoiceIndex == index
//                                         ? CustomColors.kbrandblue
//                                         : CustomColors.kGrey)),
//                             child: Text(
//                               list[index],
//                               style: CustomTextStyles.kBold14.copyWith(
//                                   color: defaultChoiceIndex == index
//                                       ? CustomColors.kWhite
//                                       : CustomColors.kGrey),
//                             ),
//                           ));
//                     }),
//                   )),
//               SizedBox(height: 12.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Text(
//                   'Size :',
//                   style: CustomTextStyles.kBold16
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Padding(
//                   padding: EdgeInsets.only(left: 20.w),
//                   child: Wrap(
//                     spacing: 16,
//                     children: List.generate(_size.length, (index) {
//                       return InkWell(
//                           onTap: () {
//                             setState(() {
//                               defaultSizeIndex == index;
//                             });
//                           },
//                           child: Container(
//                             height: 40.h,
//                             width: 40.w,
//                             padding: EdgeInsets.all(8.h),
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: defaultSizeIndex == index
//                                     ? CustomColors.kbrandblue
//                                     : Colors.transparent,

//                                 //borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                     color: defaultSizeIndex == index
//                                         ? CustomColors.kbrandblue
//                                         : CustomColors.kGrey)),
//                             child: Center(
//                               child: Text(
//                                 _size[index],
//                                 style: CustomTextStyles.kBold12.copyWith(
//                                     color: defaultSizeIndex == index
//                                         ? CustomColors.kWhite
//                                         : CustomColors.kGrey),
//                               ),
//                             ),
//                           ));
//                     }),
//                   )),
//               SizedBox(height: 12.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Text(
//                   'Price :',
//                   style: CustomTextStyles.kBold16
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Row(
//                   children: [
//                     Text(
//                       '\$0.0',
//                       style: CustomTextStyles.kBold12
//                           .copyWith(color: CustomColors.kprimarylight),
//                     ),
//                     const Spacer(),
//                     Text(
//                       '\$199.00',
//                       style: CustomTextStyles.kBold12
//                           .copyWith(color: CustomColors.kprimarylight),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Slider(
//                   activeColor: CustomColors.kbrandblue,
//                   inactiveColor: CustomColors.kGrey,
//                   thumbColor: CustomColors.kbrandblue,
//                   min: 0,
//                   max: 200,
//                   value: _value,
//                   onChanged: (value) {
//                     setState(() {
//                       _value = value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Text(
//                   'Color :',
//                   style: CustomTextStyles.kBold16
//                       .copyWith(color: CustomColors.kprimarylight),
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Wrap(
//                   spacing: 20.w,
//                   runSpacing: 12.h,
//                   children: List.generate(colours.length, (index) {
//                     return SizedBox(
//                       height: 40.h,
//                       width: 89.w,
//                       child: ChoiceChip(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24.r),
//                           side: BorderSide(
//                             color: defaultCategoryIndex == index
//                                 ? CustomColors.kWhite
//                                 : CustomColors.kGrey,
//                           ),
//                         ),
//                         disabledColor: Colors.white,
//                         labelPadding: EdgeInsets.all(2.0),
//                         label: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               radius: 6.r,
//                               backgroundColor: colours[index].colour,
//                             ),
//                             SizedBox(width: 8.w),
//                             Text(
//                               colours[index].title,
//                               style: CustomTextStyles.kBold14.copyWith(
//                                   color: defaultCategoryIndex == index
//                                       ? CustomColors.kWhite
//                                       : CustomColors.kGrey),
//                             ),
//                           ],
//                         ),
//                         selected: defaultCategoryIndex == index,
//                         selectedColor: CustomColors.kbrandblue,
//                         onSelected: (value) {
//                           setState(() {
//                             defaultCategoryIndex =
//                                 value ? index : defaultCategoryIndex;
//                           });
//                         },
//                         backgroundColor: Colors.white,
//                         elevation: 1,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 10.w, vertical: 10.h),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               SizedBox(height: 32.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: SizedBox(
//                   height: 50.h,
//                   child: CustomElevatedButton(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Show Filter',
//                           style: CustomTextStyles.kBold16
//                               .copyWith(color: CustomColors.kWhite),
//                         ),
//                         SizedBox(
//                           width: 8.w,
//                         ),
//                         Icon(Icons.arrow_forward_sharp,
//                             color: CustomColors.kWhite)
//                       ],
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//               )
//             ]),
//       ),
//     );
//   }
// }
