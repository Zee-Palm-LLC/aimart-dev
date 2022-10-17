import 'package:aimart_dev/app/modules/home/widgets/home/custom_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:aimart_dev/app/data/constants/constants.dart';

import '../../widgets/textfields/search_row.dart';
import '../../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  int selectIndex = 0;
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 28.w),
      child: Column(children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              controller: _searchController,
              isPasswordField: false,
              validator: (value) {},
              hintText: 'What are you looking for?',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            )),
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              height: 48.h,
              width: 48.w,
              child: PrimaryButton(
                child: SvgPicture.asset(CustomAssets.kfiltericon),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24.r)),
                      ),
                      context: context,
                      builder: (context) {
                        return const CustomBottomSheet();
                      });
                },
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
