import 'package:aimart_dev/app/data/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class StepperWidget extends StatefulWidget {
  List<bool> statuses;

  StepperWidget({Key? key, required this.statuses}) : super(key: key);

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  Widget buildStep(bool active, String texts, {bool isLast = false}) {
    return Opacity(
      opacity: active ? 1 : 0.2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
                color: CustomColors.kPrimary, shape: BoxShape.circle),
            child: Center(child: Text(texts)),
          ),
          if (!isLast)
            Expanded(
              child: Container(
                height: 4.h,
                width: 105.w,
                color: CustomColors.kPrimary,
              ),
            ),
        ],
      ),
    );
  }

  List<String> texts = [
    "1",
    "2",
    "3",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(3, (index) {
            if (index == (3 - 1)) {
              return SizedBox(
                  height: 32.h,
                  width: 32.w,
                  child: buildStep(widget.statuses[index], texts[index],
                      isLast: true));
            }
            return Expanded(
                child: buildStep(widget.statuses[index], texts[index]));
          }),
        ],
      ),
    );
  }
}
