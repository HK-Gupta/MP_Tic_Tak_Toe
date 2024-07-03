import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/components/primary_icon_button.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/controller/profile_controller.dart';
import 'package:mp_tic_tac_toe/pages/single_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: x/7.7,),
            Text(
                "TIC TAC TOE",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Theme.of(context).colorScheme.primary
                ),
            ),
            Text(
              "With Multiplayer",
              style: Theme.of(context).textTheme.labelMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary)
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SvgPicture.asset(IconsPath.splashIcon, width: x/2,)
              ],
            ),
            const SizedBox(height: 70,),
            PrimaryIconButton(
                buttonText: "Single Player",
                onTap: () {
                  Get.to(SinglePlayer());
                },
                iconPath: IconsPath.singleIcon,
            ),
            const SizedBox(height: 30,),
            PrimaryIconButton(
                buttonText: "Multi Player",
                onTap: () {
                  Get.toNamed("/room");
                },
                iconPath: IconsPath.multiIcon,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {} ,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: SvgPicture.asset(IconsPath.infoIcon, width: 40, height: 40,)
                  ),
                ),
                InkWell(
                  onTap: () {} ,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: SvgPicture.asset(IconsPath.gameIcon, width: 40, height: 40,)
                  ),
                ),
                InkWell(
                  onTap: () {} ,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: SvgPicture.asset(IconsPath.githubIcon, width: 40, height: 40,)
                  ),
                ),
                InkWell(
                  onTap: () {} ,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: SvgPicture.asset(IconsPath.youtubeIcon, width: 40, height: 40,)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
