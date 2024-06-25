import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/primary_icon_button.dart';
import 'package:mp_tic_tac_toe/controller/auth_controller.dart';

import '../../configs/assets_path.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: x/2,
                  height: x/2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {} ,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.insert_photo, color: Colors.white, size: 40,),
                      ),
                    ),
                    SizedBox(height: x/(2*6)),
                    InkWell(
                      onTap: () {} ,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.camera_enhance_rounded, color: Colors.white, size: 40,),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter your Name"
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              textAlign: TextAlign.center,
              "You can change these details later from Profile page.",
              style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Spacer(),
            PrimaryIconButton(
                buttonText: "Save",
                onTap: () {
                  authController.updateProfile();
                },
                iconPath: IconsPath.saveIcon),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
