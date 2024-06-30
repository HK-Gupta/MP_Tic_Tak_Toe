import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../configs/messages.dart';
import '../models/RoomModel.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;

  void copyRoomCode(String roomCode) {
    FlutterClipboard.copy(roomCode).then((value) =>
      successToastMessage("Copied"),
    );
  }
  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("roomsTTT")
        .doc(roomId)
        .snapshots()
        .map((event) => RoomModel.fromJson(event.data()));
  }
}