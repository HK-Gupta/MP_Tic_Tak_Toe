import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
            IconsPath.splashIcon,
          width: w/2.15,
          height: w/2.15,
        ),
      ),
    );
  }
}
