import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/in_game_user_card.dart';
import 'package:mp_tic_tac_toe/components/multiplayer_game_user_card.dart';
import 'package:mp_tic_tac_toe/controller/multiplayer_controller.dart';
import 'package:mp_tic_tac_toe/models/RoomModel.dart';

import '../../configs/assets_path.dart';
import '../home_page/home_page.dart';

class Multiplayer extends StatelessWidget {
  final String roomId;
  const Multiplayer({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    // Building the array of size 9.

    final  w = MediaQuery.of(context).size.width;
    final  h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;
    final auth = FirebaseAuth.instance;
    MultiplayerController multiplayerController = Get.put(MultiplayerController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: StreamBuilder(
                    stream: multiplayerController.getRoomDetails(roomId),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        RoomModel? roomModel = snapshot.data;
                        var playValue = roomModel!.gameValue;
                        var gameStatus = roomModel!.gameStatus;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (gameStatus == "draw") {
                            multiplayerController.drawDialog(
                                playValue!, roomModel);
                          } else if (gameStatus == "win") {
                            if (roomModel.isXTurn!) {
                              multiplayerController.winnerDialog("O", roomModel);
                            } else {
                              multiplayerController.winnerDialog("X", roomModel);
                            }
                          } else if(gameStatus=="gameOver"){
                            Get.offAll(const HomePage());
                          }
                        });
                        return Column(
                          children: [
                            const SizedBox(height: 60,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    MultiplayerGameUserCard(
                                      icon: IconsPath.xIcon,
                                      name: roomModel.player1!.name!,
                                      imageUrl: roomModel.player1!.image!,
                                    ),
                                    const SizedBox(height: 7,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(IconsPath.wonIcon,),
                                          const SizedBox(width: 10,),
                                          Text("WON : ${roomModel.player1!.totalWins}",
                                            style: TextStyle(
                                                color: Theme.of(context).colorScheme.secondary
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    MultiplayerGameUserCard(
                                      icon: IconsPath.oIcon,
                                      name: roomModel.player2!.name!,
                                      imageUrl: roomModel.player2!.image!,
                                    ),
                                    const SizedBox(height: 7,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(IconsPath.wonIcon,),
                                          const SizedBox(width: 10,),
                                          Text("WON : ${roomModel.player2!.totalWins}",
                                            style: TextStyle(
                                                color: Theme.of(context).colorScheme.secondary
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 22,),
                            DottedBorder(
                              borderType: BorderType.RRect,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary,
                              strokeWidth: 2,
                              dashPattern: const [10, 10],
                              radius: const Radius.circular(15),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: x/1.25,
                                height: x/1.25,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: GridView.builder(
                                    itemCount: 9,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                    itemBuilder: ((context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if((roomModel.isXTurn! && roomModel.player1?.id==auth.currentUser!.uid) ||
                                              (!roomModel.isXTurn! && roomModel.player2?.id==auth.currentUser!.uid)) {
                                            multiplayerController.updateData(
                                                roomId,
                                                playValue!,
                                                index,
                                                roomModel.isXTurn!,
                                                roomModel
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          margin: const EdgeInsets.all(0.7),
                                          decoration: BoxDecoration(
                                            borderRadius: index==0? const BorderRadius.only(topLeft: Radius.circular(15))
                                                : index==2? const BorderRadius.only(topRight: Radius.circular(15))
                                                : index==6? const BorderRadius.only(bottomLeft: Radius.circular(15))
                                                : index==8? const BorderRadius.only(bottomRight: Radius.circular(15)):
                                            const BorderRadius.only(),
                                            color: playValue?[index]=='X' ? Theme.of(context).colorScheme.primary :
                                            playValue?[index]=='O' ? Theme.of(context).colorScheme.secondary :
                                            Theme.of(context).colorScheme.primaryContainer,
                                          ),
                                          child: Center(
                                              child: playValue?[index]=='X'? SvgPicture.asset(IconsPath.xIcon, color: Colors.white, width: 40,) :
                                              playValue?[index]=='O'? SvgPicture.asset(IconsPath.oIcon, color: Colors.white, width: 45,) :
                                              const SizedBox()
                                          ),
                                        ),
                                      );
                                    })
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: roomModel.isXTurn!
                                          ? Theme.of(context).colorScheme.primary
                                          : Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      roomModel.isXTurn! ?
                                      SvgPicture.asset(IconsPath.xIcon, width: 22, color: Colors.white,):
                                      SvgPicture.asset(IconsPath.oIcon, width: 22, color: Colors.white,),
                                      const SizedBox(width: 10,),
                                      const Text(
                                          "Turn",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },),
                ),
              ),
            )
        ),
        ConfettiWidget(
          confettiController:  multiplayerController.confettiController,
          shouldLoop: false,
          blastDirection: pi/2,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Colors.green,
            Colors.blue,
          ],
          gravity: 0.01,
          emissionFrequency: 0.05,
        ),
      ]
    );
  }
}
