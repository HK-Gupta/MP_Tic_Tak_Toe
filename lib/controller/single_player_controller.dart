import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/configs/colors.dart';
import 'package:mp_tic_tac_toe/configs/messages.dart';

import '../pages/home_page.dart';

class SinglePlayerController extends GetxController {

  RxList playValue = ["", "", "", "", "", "", "", "", "",].obs;
  RxBool isXTime = true.obs;
  RxInt xScore = 0.obs;
  RxInt oScore = 0.obs;
  ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 2));

  void onClick(int index) {
    if(isXTime.isTrue) {
      playValue[index] = "X";
      isXTime.value = false;
    } else {
      playValue[index] = "O";
      isXTime.value = true;
    }
    checkWinner();

  }

  void checkWinner() {
    bool isWinner = false;
    // For Vertical checking.
    int i = 0;
    while(i<9) {
      if(playValue[i]==playValue[i+1] &&
         playValue[i]==playValue[i+2] &&
         playValue[i]!="") {
          winnerDialog(playValue[i]);
          isWinner = true;
      }
      i += 3;
    }

    // For horizontal checking.
    i=0;
    while(i<3) {
      if(playValue[i]==playValue[i+3] &&
          playValue[i]==playValue[i+6] &&
          playValue[i] != "") {
        winnerDialog(playValue[i]);
        isWinner = true;
      }
      i++;
    }

    // For diagonal checking.
    if(playValue[0]==playValue[4] && playValue[0]==playValue[8] && playValue[0]!="") {
      winnerDialog(playValue[0]);
      isWinner = true;
    }
    if(playValue[2]==playValue[4] && playValue[2]==playValue[6] && playValue[2]!="") {
      winnerDialog(playValue[2]);
      isWinner = true;
    }

    // Check for draw.
    if(!playValue.contains("") && !isWinner) {
      drawDialog();
    }
  }

  Future<dynamic>? winnerDialog(String winner) {
    confettiController.play();
    scoreCalculate(winner);
    return Get.bottomSheet(
      isDismissible: false,
      Container(
          height: 280,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(IconsPath.wonIcon, width: 100,),
                const SizedBox(height: 20,),
                const Text(
                  "Congratulation",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Player $winner won the match",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        playValue.fillRange(0, 9, "");
                        Get.back();
                      },
                      child: const Text("Play Again"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Get.offAll(const HomePage());
                      },
                      child: const Text("Exit"),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );

  }


  Future<dynamic> drawDialog() {
    return Get.bottomSheet(
        isDismissible: false,
        Container(
          height: 280,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(IconsPath.wonIcon, width: 100,),
                const SizedBox(height: 20,),
                const Text(
                  "Match Drawn",
                  style: TextStyle(fontSize: 18),
                ),
                const Text(
                  "You both are equivalent",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        playValue.fillRange(0, 9, "");
                        Get.back();
                      },
                      child: const Text("Play Again"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Get.offAll(const HomePage());
                      },
                      child: const Text("Exit"),
                    )
                  ],
                )
              ],
            ),
          )
        )
    );
  }


  void scoreCalculate(String winner) {
    if(winner=='X'){
      xScore = xScore + 1;
    } else {
      oScore = oScore + 1;
    }
  }
}