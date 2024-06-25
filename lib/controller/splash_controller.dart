import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/pages/home_page/home_page.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';
import 'package:mp_tic_tac_toe/pages/welcome_page/welcome_page.dart';

class SplashController extends GetxController {

  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splashHandler();
    super.onInit();
  }
  Future<void> splashHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if(auth.currentUser == null) {
      Get.offAll(const WelcomePage());
    } else {
      Get.offAll(const HomePage());
    }
  }
}