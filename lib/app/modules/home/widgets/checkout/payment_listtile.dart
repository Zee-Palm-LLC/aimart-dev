import 'package:aimart_dev/app/modules/home/views/checkout/selectpayment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/constants.dart';

class PaymentMethodsRadioListTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final PaymentMethods payment;
  final Function(int?) onChanged;

  const PaymentMethodsRadioListTile({
    Key? key,
    required this.payment,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      activeColor: CustomColors.kPrimary,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Container(
            height: 24.h,
            width: 32.h,
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
                color: CustomColors.kDivider,
                borderRadius: BorderRadius.circular(5.r),
                image: DecorationImage(image: AssetImage(payment.image))),
          ),
          SizedBox(width: 10.w),
          Text(payment.paymentName,
              style: CustomTextStyles.kMedium12
                  .copyWith(color: CustomColors.kDarkBlue)),
        ],
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
