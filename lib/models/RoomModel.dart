import 'dart:convert';

import 'package:mp_tic_tac_toe/models/UserModel.dart';

/// id : ""
/// entryFee : ""
/// winningPrice : ""
/// drawMatch : ""
/// player1 : "UserModel"
/// player2 : "UserModel"

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));
String roomModelToJson(RoomModel data) => json.encode(data.toJson());
 class RoomModel {
  RoomModel({
    String? id,
    String? entryFee,
    String? winningPrice,
    String? drawMatch,
    UserModel? player1,
    UserModel? player2,
  }) {
    _id = id;
    _entryFee = entryFee;
    _winningPrice = winningPrice;
    _drawMatch = drawMatch;
    _player1 = player1;
    _player2 = player2;
  }

  RoomModel.fromJson(dynamic json) {
    _id = json['id'];
    _entryFee = json['entryFee'];
    _winningPrice = json['winningPrice'];
    _drawMatch = json['drawMatch'];
    _player1 = json['player1'] != null ? UserModel.fromJson(json['player1']) : null;
    _player2 = json['player2'] != null ? UserModel.fromJson(json['player2']) : null;
  }

  String? _id;
  String? _entryFee;
  String? _winningPrice;
  String? _drawMatch;
  UserModel? _player1;
  UserModel? _player2;

  RoomModel copyWith({
    String? id,
    String? entryFee,
    String? winningPrice,
    String? drawMatch,
    UserModel? player1,
    UserModel? player2,
  }) =>
      RoomModel(
        id: id ?? _id,
        entryFee: entryFee ?? _entryFee,
        winningPrice: winningPrice ?? _winningPrice,
        drawMatch: drawMatch ?? _drawMatch,
        player1: player1 ?? _player1,
        player2: player2 ?? _player2,
      );

  String? get id => _id;
  String? get entryFee => _entryFee;
  String? get winningPrice => _winningPrice;
  String? get drawMatch => _drawMatch;
  UserModel? get player1 => _player1;
  UserModel? get player2 => _player2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['entryFee'] = _entryFee;
    map['winningPrice'] = _winningPrice;
    map['drawMatch'] = _drawMatch;
    map['player1'] = _player1 != null ? _player1!.toJson() : null;
    map['player2'] = _player2 != null ? _player2!.toJson() : null;
    return map;
  }
}


//25:00