import 'dart:io';

import 'package:aimart_dev/app/modules/home/widgets/widgets.dart';
import 'package:get/get.dart';


import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  static Future<String> uploadToStorage(
      {required File file,
      required String folderName,
      bool showDialog = true}) async {
    showDialog ? showLoadingDialog(message: "Processing...") : null;
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            '$folderName/file${DateTime.now().millisecondsSinceEpoch}',
          );

      final UploadTask uploadTask = firebaseStorageRef.putFile(file);

      final TaskSnapshot downloadUrl = await uploadTask;

      String url = await downloadUrl.ref.getDownloadURL();
      showDialog ? hideLoadingDialog() : null;
      return url;
    } on Exception catch (e) {
      showDialog ? hideLoadingDialog() : null;
      Get.snackbar('Error', e.toString());
      return "";
    }
  }
}
