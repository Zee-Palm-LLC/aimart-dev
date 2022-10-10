// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aimart_dev/app/modules/home/models/transaction_model.dart';
import 'package:intl/intl.dart';

import '../../../../data/constants/constants.dart';

class TransactionCard extends StatelessWidget {
  TransactionModel transactions;
  TransactionCard({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transactions.receiverName, style: CustomTextStyles.kBold14),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DateFormat('hh:mm a').format(transactions.transactionTime)},${DateFormat('dd LLLL yyyy').format(transactions.transactionTime)}',
                style: CustomTextStyles.kMedium12
                    .copyWith(color: CustomColors.kGrey),
              ),
              Text(
                "-\$ ${transactions.amountSent}",
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kPrimary),
              )
            ],
          )
        ],
      ),
    );
  }
}
