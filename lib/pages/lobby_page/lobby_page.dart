import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/user_card.dart';
import 'package:mp_tic_tac_toe/controller/lobby_controller.dart';
import 'package:mp_tic_tac_toe/pages/game_page/multiplayer.dart';
import 'package:mp_tic_tac_toe/pages/widgets/pricing_area.dart';
import 'package:mp_tic_tac_toe/pages/widgets/room_info.dart';

import '../../components/primary_button.dart';
import '../../configs/assets_path.dart';

class LobbyPage extends StatelessWidget {
  final String roomId;
  const LobbyPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    LobbyController lobbyController = Get.put(LobbyController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(IconsPath.backIcon)
                    ),
                    const SizedBox(width: 15,),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                ///Room Info
                RoomInfo(roomCode: roomId),
                const SizedBox(height: 25,),
                /// Fee Layout
                StreamBuilder(
                    stream: lobbyController.getRoomDetails(roomId),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          children: [
                            PricingArea(
                              entryFee: snapshot.data!.entryFee!,
                              winningPrice: snapshot.data!.winningPrice!,
                            ),
                            const SizedBox(height: 90),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UserCard(
                                  name: snapshot.data!.player1!.name!,
                                  imageUrl: snapshot.data!.player1!.image!,
                                  coins: "00",
                                ),
                                snapshot.data!.player2==null?
                                    Container(
                                      width: w/2.6,
                                      child: Text("Waiting for Other"),
                                    ) :
                                UserCard(
                                  name: snapshot.data!.player2!.name!,
                                  imageUrl: snapshot.data!.player2!.image!,
                                  coins: "00",
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            PrimaryButton(
                                buttonText: "Start",
                                onTap: () {
                                  Get.to(Multiplayer());
                                }
                            )
                          ],
                        );
                      }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
