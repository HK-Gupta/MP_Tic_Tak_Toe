import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/user_card.dart';
import 'package:mp_tic_tac_toe/pages/game_page/game_page.dart';
import 'package:mp_tic_tac_toe/pages/widgets/pricing_area.dart';
import 'package:mp_tic_tac_toe/pages/widgets/room_info.dart';

import '../../components/primary_button.dart';
import '../../configs/assets_path.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(IconsPath.backIcon),
                    const SizedBox(width: 15,),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                ///Room Info
                const RoomInfo(roomCode: "12345"),
                const SizedBox(height: 25,),
                /// Fee Layout
                const PricingArea(),
                const SizedBox(height: 90),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserCard(),
                    UserCard(),
                  ],
                ),
                const SizedBox(height: 30,),
                PrimaryButton(
                    buttonText: "Start",
                    onTap: () {
                      Get.to(GamePage());
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
