import 'dart:io';

import 'package:aimart_dev/app/data/constants/typograpghy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../services/image_picker_services.dart';

class ImagePickDialog extends StatelessWidget {
  final VoidCallback cameraCallback;
  final VoidCallback galleryCallback;
  const ImagePickDialog({
    Key? key,
    required this.cameraCallback,
    required this.galleryCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Image", style: CustomTextStyles.kBold20),
      content: SizedBox(
        height: 100.h,
        child: Column(children: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: cameraCallback,
            child: Row(
              children: [
                const Icon(Icons.camera),
                SizedBox(width: 5.w),
                Text(
                  "Select Image from Camera",
                  style: CustomTextStyles.kMedium16,
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: galleryCallback,
            child: Row(
              children: [
                const Icon(Icons.photo),
                SizedBox(width: 5.w),
                Text(
                  "Select Image from Gallery",
                  style: CustomTextStyles.kMedium16,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ImagePickerDialogBox {
  static Future<File?> pickSingleImage(Function(File) callBack) async {
    File? pickedFile;
    Get.dialog(ImagePickDialog(
      cameraCallback: () async {
        Get.back();
        0.5.seconds.delay().then((value) async {
          pickedFile = await ImagePickerServices().getImageFromCamera();
          if (pickedFile != null) {
            callBack(pickedFile!);
            return pickedFile;
          }
        });
      },
      galleryCallback: () async {
        Get.back();
        0.5.seconds.delay().then((value) async {
          pickedFile = await ImagePickerServices().getImageFromGallery();
          if (pickedFile != null) {
            callBack(pickedFile!);

            return pickedFile;
          }
        });
      },
    ));
    return pickedFile;
  }
}
