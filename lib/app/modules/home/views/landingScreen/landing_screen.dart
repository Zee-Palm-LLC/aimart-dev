import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/views/discover/dicover_screen.dart';
import 'package:aimart_dev/app/modules/home/views/profile/my_profile_screen.dart';
import 'package:aimart_dev/app/modules/home/views/wishlistScreen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../historyScreens/history_screens.dart';
import '../home/home_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  late BuildContext? testContext;
  bool notification = false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(_controller.index == 0
                        ? CustomAssets.khomeactive
                        : CustomAssets.khomeinactive)),
              ],
            ),
            NotificationIcon(notification: notification)
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(_controller.index == 1
                        ? CustomAssets.kdiscoveractive
                        : CustomAssets.kdiscoverinactive)),
              ],
            ),
            NotificationIcon(notification: notification)
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(_controller.index == 2
                        ? CustomAssets.kfavouriteactive
                        : CustomAssets.kfavouriteinactive)),
              ],
            ),
            NotificationIcon(notification: notification)
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(_controller.index == 3
                        ? CustomAssets.kcartactive
                        : CustomAssets.kcartinactive)),
              ],
            ),
            NotificationIcon(notification: notification)
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(_controller.index == 4
                        ? CustomAssets.kprofileactive
                        : CustomAssets.kprofileinactive)),
              ],
            ),
            NotificationIcon(notification: notification)
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        padding: const NavBarPadding.all(0),
        screens: [
          HomePage(),
          DicoverScreen(),
          WishListScreen(),
          HistoryScreen(),
          ProfileScreen()
        ],
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: CustomColors.kWhite,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : 80.h,
        hideNavigationBarWhenKeyboardShows: true,
        popActionScreens: PopActionScreensType.once,

        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
          colorBehindNavBar: CustomColors.kWhite,
        ),
        popAllScreensOnTapOfSelectedTab: true,

        onItemSelected: (val) => setState(() {}),
        navBarStyle:
            NavBarStyle.simple, // Choose the nav bar style with this property
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final bool notification;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: notification
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: CustomColors.kError),
              alignment: Alignment.center,
            )
          : const SizedBox(),
    );
  }
}
