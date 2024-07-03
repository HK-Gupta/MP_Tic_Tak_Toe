import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/messages.dart';
import 'package:mp_tic_tac_toe/models/UserModel.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page.dart';
import 'package:uuid/uuid.dart';

import '../models/RoomModel.dart';

class RoomController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var uuid = Uuid();
  RxString roomCode = "".obs;
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  Future<void> getUserDetails() async {
    await db.collection("usersTTT").doc(auth.currentUser!.uid).get().then((value) {
      user.value = UserModel.fromJson(value.data()!);
    });
  }

  Future<void> createRoom() async{
    isLoading.value = true;
    String id = uuid.v4().substring(0,8).toUpperCase();
    roomCode.value = id;
    var player1 = UserModel(
      id: user.value.id,
      name: user.value.name,
      email: user.value.email,
      image: user.value.image,
      totalWins: "0",
      role: "admin"
    );

    var newRoom = RoomModel(
      id: id,
      entryFee: "15",
      winningPrice: "30",
      drawMatch: "0",
      player1: player1,
      gameStatus: "ongoing",
      player1Status: "waiting",
      gameValue: ["", "", "", "", "", "", "", "", ""],
      isXTurn: true,
    );

    try {
      await db.collection("roomsTTT").doc(id).set(newRoom.toJson());
      successToastMessage("Room Created Successfully");
      Get.to(LobbyPage(roomId: id));
    } catch(e) {
      errorToastMessage("Error in Room Creation");
      print("Error: $e");
    }

    isLoading.value = false;
  }

  Future<void> joinRoom(String roomId) async {
    isLoading.value=true;
    var player2 = UserModel(
        id: user.value.id,
        name: user.value.name,
        email: user.value.email,
        image: user.value.image,
        totalWins: "0",
        role: "player"
    );
    try{
      await db.collection("roomsTTT").doc(roomId).update({
        "player2": player2.toJson(),
        "player2Status": "waiting",
      });
      Get.to(LobbyPage(roomId: roomId));
      successToastMessage("Joined");
    } catch(e){
      print(e);
      errorToastMessage("Failed to Join");
    }
    isLoading.value = false;
  }

}