import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/in_game_user_card.dart';
import 'package:mp_tic_tac_toe/configs/messages.dart';
import 'package:mp_tic_tac_toe/controller/single_player_controller.dart';

import '../../configs/assets_path.dart';

class SinglePlayer extends StatelessWidget {
  const SinglePlayer ({super.key});

  @override
  Widget build(BuildContext context) {

    SinglePlayerController singlePlayerController = Get.put(SinglePlayerController());
    final  w = MediaQuery.of(context).size.width;
    final  h = MediaQuery.of(context).size.height;

    final x = w<h ? w: h/1.3;

    return Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton (
                onPressed: () {},
                child: Icon(CupertinoIcons.chat_bubble_text_fill, size: 33,color: Theme.of(context).colorScheme.primary),
              ),
              FloatingActionButton (
                onPressed: () {
                  singlePlayerController.playValue.fillRange(0, 9, "");
                  singlePlayerController.isXTime.value = true;
                },
                child: Icon(CupertinoIcons.restart, size: 33,color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 45,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const InGameUserCard(icon: IconsPath.xIcon,),
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
                                Obx(() =>
                                    Text("WON : ${singlePlayerController.xScore.value}",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.secondary
                                      ),
                                    ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const InGameUserCard(icon: IconsPath.oIcon ,),
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
                                Obx(() =>
                                    Text("WON : ${singlePlayerController.oScore.value}",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.secondary
                                      ),
                                    ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 22,),
                  // Main Playing area
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
                      child: Obx(() =>
                          GridView.builder(
                              itemCount: singlePlayerController.playValue.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    if(singlePlayerController.playValue[index]=="") {
                                      singlePlayerController.onClick(index);
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
                                      color: singlePlayerController.playValue[index]=='X' ? Theme.of(context).colorScheme.primary :
                                      singlePlayerController.playValue[index]=='O' ? Theme.of(context).colorScheme.secondary :
                                      Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    child: Center(
                                        child:  singlePlayerController.playValue[index]=='X'? SvgPicture.asset(IconsPath.xIcon, color: Colors.white, width: 40,) :
                                        singlePlayerController.playValue[index]=='O'? SvgPicture.asset(IconsPath.oIcon, color: Colors.white, width: 45,) :
                                        const SizedBox()
                                    ),
                                  ),
                                );
                              })
                          ),
                      )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  // Turning Indicator
                  Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: singlePlayerController.isXTime.value
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                singlePlayerController.isXTime.value ?
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
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
