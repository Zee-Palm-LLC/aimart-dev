import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

class SearchRow extends StatelessWidget {
  final String svg;
  final String text;
  final VoidCallback onClearPressed;
  const SearchRow({
    Key? key,
    required this.svg,
    required this.text,
    required this.onClearPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20.w, width: 20.w, child: SvgPicture.asset(svg)),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: CustomTextStyles.kMedium16
              .copyWith(color: CustomColors.kprimarylight),
        ),
        const Spacer(),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: SvgPicture.asset(
            CustomAssets.crosscancel,
          ),
          onPressed: onClearPressed,
        ),
      ],
    );
  }
}
