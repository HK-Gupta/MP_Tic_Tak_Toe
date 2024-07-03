import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/colors.dart';
import 'package:mp_tic_tac_toe/controller/lobby_controller.dart';
import 'package:mp_tic_tac_toe/controller/room_controller.dart';

import '../../configs/assets_path.dart';

class RoomInfo extends StatelessWidget {
  final String roomCode;
  const RoomInfo({super.key, required this.roomCode});

  @override
  Widget build(BuildContext context) {
    LobbyController lobbyController = Get.put(LobbyController());

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .primary,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Generated Room Card", ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: blueCross,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    roomCode,
                                  style: const TextStyle (
                                    fontSize: 30,
                                    letterSpacing: 2.1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          lobbyController.copyRoomCode(roomCode);
                        },
                        child: Container(
                          padding: EdgeInsets.all(14),
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blueCross
                          ),
                          child: SvgPicture.asset(IconsPath.copyIcon),
                        
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Share the code to your friend & Ask them to join the game",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        color: Colors.white
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
