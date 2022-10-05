// import 'package:aimart_dev/app/data/constants/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// class LandingPage extends StatefulWidget {
//   @override
//   _LandingPageState createState() => _LandingPageState();
// }
// class _LandingPageState extends State<LandingPage> {
//   late PersistentTabController _controller;
//   late bool _hideNavBar;
//   late BuildContext? testContext;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     _hideNavBar = false;
//   }
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Container(
//           width: 100.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                   height: 28.w,
//                   width: 28.w,
//                   child: SvgPicture.asset(
//                     CustomAssets.kHome,
//                     color: _controller.index == 0
//                         ? CustomColors.kPrimary
//                         : CustomColors.kGrey1,
//                   )),
//               Text(
//                 AppTexts.home,
//                 style: CustomTextStyle.kMedium12.copyWith(
//                   color: _controller.index == 0
//                       ? CustomColors.kPrimary
//                       : CustomColors.kGrey1,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Container(
//           width: 100.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                   height: 28.w,
//                   width: 28.w,
//                   child: SvgPicture.asset(
//                     CustomAssets.kJobs,
//                     color: _controller.index == 1
//                         ? CustomColors.kPrimary
//                         : CustomColors.kGrey1,
//                   )),
//               Text(
//                 AppTexts.jobs,
//                 style: CustomTextStyle.kMedium12.copyWith(
//                   color: _controller.index == 1
//                       ? CustomColors.kPrimary
//                       : CustomColors.kGrey1,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Container(
//           width: 100.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                   height: 28.w,
//                   width: 28.w,
//                   child: SvgPicture.asset(
//                     CustomAssets.kMessages,
//                     color: _controller.index == 2
//                         ? CustomColors.kPrimary
//                         : CustomColors.kGrey1,
//                   )),
//               Text(
//                 AppTexts.message,
//                 style: CustomTextStyle.kMedium12.copyWith(
//                   color: _controller.index == 2
//                       ? CustomColors.kPrimary
//                       : CustomColors.kGrey1,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Container(
//           width: 100.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                   height: 28.w,
//                   width: 28.w,
//                   child: SvgPicture.asset(
//                     CustomAssets.kProfile,
//                     color: _controller.index == 3
//                         ? CustomColors.kPrimary
//                         : CustomColors.kGrey1,
//                   )),
//               Text(
//                 AppTexts.profile,
//                 style: CustomTextStyle.kMedium12.copyWith(
//                   color: _controller.index == 3
//                       ? CustomColors.kPrimary
//                       : CustomColors.kGrey1,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PersistentTabView(
//           context,
//           controller: _controller,
//           padding: NavBarPadding.all(0),
//           screens: [
//             HomePage(accountMode: uc.user.accountMode),
//             JobScreen(),
//             // ChannelPage(channel: uc.channel),
//             MessagesScreen(),
//             Profile(),
//           ],
//           items: _navBarsItems(),
//           confineInSafeArea: true,
//           backgroundColor: CustomColors.kWhite,
//           handleAndroidBackButtonPress: true,
//           resizeToAvoidBottomInset: true,
//           stateManagement: true,
//           navBarHeight:
//               MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : 80.h,
//           hideNavigationBarWhenKeyboardShows: true,
//           //  margin: EdgeInsets.only(bottom: 10.0),
//           popActionScreens: PopActionScreensType.once,
//           bottomScreenMargin: 80.h,
//           selectedTabScreenContext: (context) {
//             testContext = context;
//           },
//           hideNavigationBar: _hideNavBar,
//           decoration: NavBarDecoration(
//               colorBehindNavBar: CustomColors.kWhite,
//               border: Border(top: BorderSide(color: CustomColors.kGrey3))),
//           popAllScreensOnTapOfSelectedTab: true,
//           itemAnimationProperties: ItemAnimationProperties(
//             duration: Duration(milliseconds: 400),
//             curve: Curves.ease,
//           ),
//           onItemSelected: (val) => setState(() {}),
//           screenTransitionAnimation: ScreenTransitionAnimation(
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarStyle:
//               NavBarStyle.simple, // Choose the nav bar style with this property
//         ),
//       );
//   }
// }


