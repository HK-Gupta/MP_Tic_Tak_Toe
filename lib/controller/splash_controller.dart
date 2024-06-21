import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';
import 'package:mp_tic_tac_toe/pages/welcome_page/welcome_page.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    splashHandler();
    super.onInit();
  }
  Future<void> splashHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll(const WelcomePage());
  }
}