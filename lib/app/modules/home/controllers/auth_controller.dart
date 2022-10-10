import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../services/database_services.dart';
import '../../../services/firebase_storage.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';
class AuthController extends GetxController {
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _firebaseUser.value;
  DatabaseService db = DatabaseService();
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    update();
    super.onInit();
  }
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      showLoadingDialog(message: 'Signing Please wait');
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoadingDialog();
      Get.back();
    } on Exception catch (err) {
      hideLoadingDialog();
      Get.snackbar('Error', err.toString());
    }
  }
  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String username,
      required File? profilePic}) async {
    try {
      showLoadingDialog(message: 'Creating Account');
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        hideLoadingDialog();
        createFirebaseUser(
            isEmail: true,
            user: UserModel(
              uid: value.user!.uid,
              fullName: username,
              email: value.user!.email,
              profilePic: '',
            )).then((value) async {
          if (profilePic != null) {
            String imagePath = await FirebaseStorageServices.uploadToStorage(
                file: profilePic, folderName: 'Users');
            await db.usersCollection
                .doc(user!.uid)
                .update({'profilePic': imagePath});
          }
        });
      });
      Get.close(1);
    } on Exception catch (err) {
      hideLoadingDialog();
      Get.snackbar("Error", err.toString());
    }
  }
  Future<void> createFirebaseUser(
      {required UserModel user, required bool isEmail}) async {
    try {
      await db.usersCollection.doc(user.uid).set(user);
    } on FirebaseException catch (err) {
      Get.snackbar('Erro', err.toString());
    }
  }
  // Future<void> signInWithGoogle() async {
  //   showLoadingDialog(message: AppTexts.loading);
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser != null) {
  //     try {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       OAuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       UserCredential result = await _auth.signInWithCredential(credential);
  //       User? user = result.user;
  //       if (user != null) {
  //         result.additionalUserInfo!.isNewUser
  //             ? createFirebaseUser(
  //                 isEmail: false,
  //                 user: UserModel(
  //                   uid: user.uid,
  //                   userName: user.displayName,
  //                   email: user.email,
  //                   profilePic: user.photoURL,
  //                 ))
  //             : null;
  //       }
  //       hideLoadingDialog();
  //       Get.back(); // to go to root
  //     } on Exception catch (err) {
  //       hideLoadingDialog();
  //       showErrorDialog(err.toString());
  //     }
  //   } else {
  //     hideLoadingDialog();
  //   }
  // }
  // Future<void> changePassword({
  //   required String currentPassword,
  //   required String newPassword,
  // }) async {
  //   User user = _auth.currentUser!;
  //   final cred = EmailAuthProvider.credential(
  //       email: user.email!, password: currentPassword);
  //   user.reauthenticateWithCredential(cred).then((value) {
  //     user.updatePassword(newPassword).then((_) {
  //       Get.snackbar(
  //         AppTexts.loading,
  //         AppTexts.passwordChanged,
  //         backgroundColor: Colors.white,
  //       );
  //     }).catchError((error) {
  //       showErrorDialog(error);
  //     });
  //   }).catchError((err) {
  //     showErrorDialog(err);
  //   });
  // }
  Future<void> signOut() async {
    await _auth.signOut();
    hideLoadingDialog();
  }
}