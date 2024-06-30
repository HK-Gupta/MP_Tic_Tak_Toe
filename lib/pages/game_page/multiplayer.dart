import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/components/in_game_user_card.dart';

import '../../configs/assets_path.dart';

class Multiplayer extends StatelessWidget {
  const Multiplayer({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the array of size 9.
    var playValue = ["X", "O", "O",
                     "", "X", "",
                     "", "", "O",];
    final  w = MediaQuery.of(context).size.width;
    final  h = MediaQuery.of(context).size.height;

    final x = w<h ? w: h/1.3;

    return Scaffold(
      floatingActionButton: FloatingActionButton (
        onPressed: () {},
        child: SvgPicture.asset(IconsPath.micIcon),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                      "Play Game",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(height: 70,),
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
                              Text("WON : 12",
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
                              SizedBox(width: 10,),
                              Text("WON : 12",
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
                          return Container(
                            margin: const EdgeInsets.all(0.7),
                            decoration: BoxDecoration(
                              borderRadius: index==0? const BorderRadius.only(topLeft: Radius.circular(15))
                                          : index==2? const BorderRadius.only(topRight: Radius.circular(15))
                                          : index==6? const BorderRadius.only(bottomLeft: Radius.circular(15))
                                          : index==8? const BorderRadius.only(bottomRight: Radius.circular(15)):
                                                      const BorderRadius.only(),
                              color: playValue[index]=='X' ? Theme.of(context).colorScheme.primary :
                                     playValue[index]=='O' ? Theme.of(context).colorScheme.secondary :
                                     Theme.of(context).colorScheme.primaryContainer,
                            ),
                            child: Center(
                              child: playValue[index]=='X'? SvgPicture.asset(IconsPath.xIcon, color: Colors.white, width: 40,) :
                                     playValue[index]=='O'? SvgPicture.asset(IconsPath.oIcon, color: Colors.white, width: 45,) :
                                         const SizedBox()
                            ),
                          );
                        })
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
