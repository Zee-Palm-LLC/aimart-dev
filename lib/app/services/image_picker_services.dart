import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerServices {
  File? image;
  final _picker = ImagePicker();

  Future<File?> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    } else {
      Get.snackbar("No Image", "Image not Selected");
      return null;
    }
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    } else {
      Get.snackbar("No Image", "Image not Selected");
      return null;
    }
  }

  Future<List<File>?> pickMultipleImages() async {
    final res = await _picker.pickMultiImage();
    if (res != null) {
      List<File> images = [];
      for (var image in res) {
        images.add(File(image.path));
      }
      return images;
    } else {
      return [];
    }
  }
}
