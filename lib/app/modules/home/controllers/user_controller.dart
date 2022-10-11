import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../../services/database_services.dart';
import '../../../services/firebase_storage.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';
import 'auth_controller.dart';

class UserController extends GetxController {
  Rx<UserModel?> _userModel = UserModel().obs;
  UserModel get user => currentUser.value;
  String get currentUid => user.uid!;
  set user(UserModel user) => _userModel.value = user;
  Rx<UserModel> currentUser = Rx<UserModel>(UserModel());

  AuthController authController = Get.find<AuthController>();
  DatabaseService db = DatabaseService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<UserModel?> get currentUserStream {
    return db.usersCollection
        .doc(Get.find<AuthController>().user!.uid)
        .snapshots()
        .map((event) => event.data());
  }

  DocumentReference get currentUserRef {
    return db.usersCollection.doc(Get.find<AuthController>().user!.uid);
  }

  @override
  void onInit() {
    currentUser.bindStream(currentUserStream.map((event) {
      if (event == null) {
        var fbuser = authController.user;
        update();
        return UserModel(
          email: fbuser!.email ?? "",
          uid: fbuser.uid,
        );
      } else {
        UserModel _currentUser = event;
        update();
        return _currentUser;
      }
    }));
    super.onInit();
  }

  Future<void> updateUserInfo({required UserModel userModel}) async {
    showLoadingDialog(message: 'Updating Profile');
    try {
      // if (imageFile != null) {
      //   profilePic = await FirebaseStorageServices.uploadToStorage(
      //       file: imageFile, folderName: 'Users');
      // }
      await db.usersCollection.doc(currentUid).update(userModel.toMap());

      hideLoadingDialog();
      Get.back();
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  Future<void> onReady() async {
    if (authController.initialized) {
      initializeControllers();
    }
    super.onReady();
  }

  void initializeControllers() {}
}
