import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../configs/assets_path.dart';
import '../models/RoomModel.dart';
import '../pages/home_page/home_page.dart';

class MultiplayerController extends GetxController {
  ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 2));
  final db = FirebaseFirestore.instance;

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("roomsTTT")
        .doc(roomId)
        .snapshots()
        .map((event) => RoomModel.fromJson(event.data()));
  }
  Future<void> updateData(String roomId, List<String> gameValue, int index, bool isXTurn, RoomModel roomModel) async {
    List<String> newValue = gameValue;
    String turn = isXTurn? "X": "O";
    if(newValue[index]=="") {
      newValue[index] = turn;
      await db.collection("roomsTTT").doc(roomId).update({
        "gameValue": newValue,
        "isXTurn": !isXTurn,
      });
    }
    checkWinner(newValue, roomModel);
  }

  void checkWinner(List<String> playValue, RoomModel roomModel) {
    bool isWinner = false;
    // For Vertical checking.
    int i = 0;
    while(i<9) {
      if(playValue[i]==playValue[i+1] &&
          playValue[i]==playValue[i+2] &&
          playValue[i]!="") {
        // winnerDialog(playValue[i], roomModel);
        updateWinningStatus(roomModel, 'win');
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
        // winnerDialog(playValue[i], roomModel);
        updateWinningStatus(roomModel, 'win');
        isWinner = true;
      }
      i++;
    }

    // For diagonal checking.
    if(playValue[0]==playValue[4] && playValue[0]==playValue[8] && playValue[0]!="") {
      // winnerDialog(playValue[0], roomModel);
      updateWinningStatus(roomModel, 'win');
      isWinner = true;
    }
    if(playValue[2]==playValue[4] && playValue[2]==playValue[6] && playValue[2]!="") {
      // winnerDialog(playValue[2], roomModel);
      updateWinningStatus(roomModel, 'win');
      isWinner = true;
    }

    // Check for draw.
    if(!playValue.contains("") && !isWinner) {
      updateWinningStatus(roomModel, "draw");
    }
  }

  Future<dynamic>? winnerDialog(String winner, RoomModel roomModel) {
    confettiController.play();
    return Get.bottomSheet(
      isDismissible: false,
      Container(
        height: 280,
        decoration: const BoxDecoration(
          color: Colors.greenAccent,
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
                      playAgain(roomModel.gameValue!, winner, roomModel);
                    },
                    child: const Text("Play Again"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      updateWinningStatus(roomModel, "gameOver");
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
  Future<dynamic> drawDialog(List<String> playValue, RoomModel roomModel) {
    return Get.bottomSheet(
      isDismissible: false,
      Container(
        height: 280,
        decoration: const BoxDecoration(
          color: Colors.blue,
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
                      playAgain(playValue, "", roomModel);
                    },
                    child: const Text("Play Again"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      updateWinningStatus(roomModel, "gameOver");
                    },
                    child: const Text("Exit"),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void playAgain(List<String> playValue, String winner, RoomModel roomModel) async {
    playValue.fillRange(0, 9, "");
    if(winner == "") {
      await db.collection("roomsTTT").doc(roomModel.id).update({
        "gameValue": playValue,
        "gameStatus": "playing",
      });
    }
    else {
      String player = "";
      int totalWin = 0;
      int totalCoin = 0;
      String email = "";
      String id = "";
      String image = "";
      String name = "";
      String role = "";

      if(winner == "X") {
        player = "player1";
        email = roomModel.player1!.email!;
        id = roomModel.player1!.id!;
        image = roomModel.player1!.image!;
        name = roomModel.player1!.name!;
        role = roomModel.player1!.role!;
        String totalWins = roomModel.player1!.totalWins!;
        String totalCoins = roomModel.player1?.totalCoins ?? '0';

        totalWin = int.parse(totalWins) + 1;
        totalCoin = int.parse(totalCoins) + 30;
      }else {
        player = "player2";
        email = roomModel.player2!.email!;
        id = roomModel.player2!.id!;
        image = roomModel.player2!.image!;
        name = roomModel.player2!.name!;
        role = roomModel.player2!.role!;
        String totalWins = roomModel.player2!.totalWins!;
        String totalCoins = roomModel.player2?.totalCoins ?? '0';
        totalWin = int.parse(totalWins) + 1;
        totalCoin = int.parse(totalCoins) + 30;
      }

      await db.collection("roomsTTT").doc(roomModel.id).update({
        "gameValue": playValue,
        "isXTurn": player=="player1",
        "gameStatus": "playing",
        player: {
          "email": email,
          "id": id,
          "image": image,
          "name": name,
          "role": role,
          "totalCoins": totalCoin.toString(),
          "totalWins": totalWin.toString(),
        },
      });
      await db.collection("usersTTT").doc(id).update({
        "email": email,
        "id": id,
        "image": image,
        "name": name,
        "role": role,
        "totalCoins": totalCoin.toString(),
        "totalWins": totalWin.toString(),
      });
    }

    Get.back();
  }

  void updateWinningStatus(RoomModel roomModel, String status) async{
    await db.collection("roomsTTT").doc(roomModel.id).update({
      "gameStatus": status,
    });
  }


}