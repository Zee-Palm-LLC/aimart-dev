import 'package:aimart_dev/app/data/constants/constants.dart';
import 'package:aimart_dev/app/modules/home/views/historyScreens/cancel.dart';
import 'package:aimart_dev/app/modules/home/views/historyScreens/delivery.dart';
import 'package:aimart_dev/app/modules/home/widgets/textfields/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/appbar/primary_appbar.dart';
import 'all_status.dart';
import 'pending.dart';
import 'progress.dart';
import 'waiting_payment.dart';

class HistoryScreen extends StatelessWidget {
  final TextEditingController _search = TextEditingController();
  HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: primaryAppbar(title: 'History Order'),
          body: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: SearchBar(
                  controller: _search,
                  hintText: 'Search id order in here..',
                ),
              ),
              SizedBox(height: 24.h),
              TabBar(
                labelColor: CustomColors.kDarkBblue,
                unselectedLabelColor: CustomColors.kGrey,
                indicatorColor: CustomColors.kDarkBblue,
                indicatorWeight: 2.h,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                      child: Text(
                    'All Status',
                    style: CustomTextStyles.kMedium16,
                  )),
                  Tab(
                      child: Text(
                    'Pending',
                    style: CustomTextStyles.kMedium16,
                  )),
                  Tab(
                      child: Text(
                    'Process',
                    style: CustomTextStyles.kMedium16,
                  )),
                  Tab(
                      child: Text(
                    'Waiting Payment',
                    style: CustomTextStyles.kMedium16,
                  )),
                  Tab(
                      child: Text(
                    'Delivery',
                    style: CustomTextStyles.kMedium16,
                  )),
                  Tab(
                      child: Text(
                    'Cancel',
                    style: CustomTextStyles.kMedium16,
                  ))
                ],
              ),
              SizedBox(height: 32.h),
              // ignore: prefer_const_constructors
              Expanded(
                child: TabBarView(children: [
                  AllStatus(),
                  PendingHistoryScreen(),
                  ProgressHistoryScreen(),
                  WaitingPayment(),
                  DeliveryHistoryScreen(),
                  CancelHistoryScreen()
                ]),
              )
            ],
          )),
    );
  }
}
