import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mp_tic_tac_toe/configs/messages.dart';
import 'package:mp_tic_tac_toe/pages/home_page/home_page.dart';
import 'package:mp_tic_tac_toe/pages/update_profile/update_profile.dart';

import '../models/UserModel.dart';

class AuthController extends GetxController {

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      auth.signInWithCredential(credential);
      successToastMessage("Login Success");
      Get.to(UpdateProfile());

    } catch(e) {
      errorToastMessage("LoginFailed \nError: $e");
      print("Error xyz $e");
    }

  }

}