import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/user_card.dart';
import 'package:mp_tic_tac_toe/configs/messages.dart';
import 'package:mp_tic_tac_toe/controller/lobby_controller.dart';
import 'package:mp_tic_tac_toe/controller/room_controller.dart';
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
    RoomController roomController = Get.put(RoomController());
    RxInt timer = 5.obs;
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
                        child: SvgPicture.asset(IconsPath.backIcon)),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                ///Room Info
                RoomInfo(roomCode: roomId),
                const SizedBox(
                  height: 25,
                ),

                /// Fee Layout
                StreamBuilder(
                    stream: lobbyController.getRoomDetails(roomId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if(snapshot.data!.player1Status=='ready' &&
                            snapshot.data!.player2Status=='ready') {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Get.to(Multiplayer(roomId: roomId,));
                          });
                        }
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
                                  coins: snapshot.data?.player1?.totalCoins ?? "00",
                                  status: snapshot.data!.player1Status!,
                                ),
                                snapshot.data!.player2 == null
                                    ? Container(
                                        width: w / 2.6,
                                        child: const Text("Waiting for Other"),
                                      )
                                    : UserCard(
                                        name: snapshot.data!.player2!.name!,
                                        imageUrl:
                                            snapshot.data!.player2!.image!,
                                        coins: snapshot.data?.player2?.totalCoins ?? "00",
                                        status: snapshot.data!.player2Status!,
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            snapshot.data!.player1!.email == roomController.user.value.email
                                ? PrimaryButton(
                                    buttonText: "Start Game",
                                    onTap: () {
                                        lobbyController.updatePlayer1Status(roomId, "ready");
                                    })
                                : snapshot.data!.player2Status == "waiting"
                                    ? PrimaryButton(
                                        buttonText: "Ready",
                                        onTap: () async {
                                          lobbyController.updatePlayer2Status(roomId, "ready");
                                        })
                                    : snapshot.data!.player2Status == "ready"
                                        ? PrimaryButton(
                                            buttonText: "Waiting to Start",
                                            onTap: () async {
                                              lobbyController.updatePlayer2Status(roomId, "waiting");
                                            })
                                        : PrimaryButton(
                                            buttonText: "Start", onTap: () {})
                          ],
                        );

                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
