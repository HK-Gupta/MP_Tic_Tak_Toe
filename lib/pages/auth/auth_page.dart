import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/primary_icon_button.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/controller/auth_controller.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;
    AuthController authController = Get.put(AuthController());
    RxBool isLoading = false.obs;

    return Scaffold(
      body:Container(
        padding: const EdgeInsets.all(10),
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(IconsPath.splashIcon, width: x/1.8,),
            const SizedBox(height: 30,),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Please sign in to continue",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            PrimaryIconButton(
                buttonText: "Login/Signup with Google",
                onTap: () {
                  authController.login();
                },
                iconPath: IconsPath.googleIcon),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
