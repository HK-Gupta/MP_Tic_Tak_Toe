import 'dart:convert';

import 'package:mp_tic_tac_toe/models/UserModel.dart';

/// id : ""
/// entryFee : ""
/// winningPrice : ""
/// drawMatch : ""
/// player1 : "UserModel"
/// player2 : "UserModel"
/// gameStatus : ""

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
    String? gameStatus,
    String? player1Status,
    String? player2Status,
    List<String>? gameValue,
    bool? isXTurn,
  }) {
    _id = id;
    _entryFee = entryFee;
    _winningPrice = winningPrice;
    _drawMatch = drawMatch;
    _player1 = player1;
    _player2 = player2;
    _gameStatus = gameStatus;
    _player1Status = player1Status;
    _player2Status = player2Status;
    _gameValue = gameValue;
    _isXTurn = isXTurn;
  }

  RoomModel.fromJson(dynamic json) {
    _id = json['id'];
    _entryFee = json['entryFee'];
    _winningPrice = json['winningPrice'];
    _drawMatch = json['drawMatch'];
    _player1 = json['player1'] != null ? UserModel.fromJson(json['player1']) : null;
    _player2 = json['player2'] != null ? UserModel.fromJson(json['player2']) : null;
    _gameStatus = json['gameStatus'];
    _player1Status = json['player1Status'];
    _player2Status = json['player2Status'];
    _gameValue = json['gameValue'] != null ? json['gameValue'].cast<String>() : [];
    _isXTurn = json['isXTurn'];
  }

  String? _id;
  String? _entryFee;
  String? _winningPrice;
  String? _drawMatch;
  UserModel? _player1;
  UserModel? _player2;
  String? _gameStatus;
  String? _player1Status;
  String? _player2Status;
  List<String>? _gameValue;
  bool? _isXTurn;

  RoomModel copyWith({
    String? id,
    String? entryFee,
    String? winningPrice,
    String? drawMatch,
    UserModel? player1,
    UserModel? player2,
    String? gameStatus,
    String? player1Status,
    String? player2Status,
    List<String>? gameValue,
    bool? isXTurn,
  }) =>
      RoomModel(
        id: id ?? _id,
        entryFee: entryFee ?? _entryFee,
        winningPrice: winningPrice ?? _winningPrice,
        drawMatch: drawMatch ?? _drawMatch,
        player1: player1 ?? _player1,
        player2: player2 ?? _player2,
        gameStatus: gameStatus ?? _gameStatus,
        player1Status: player1Status ?? _player1Status,
        player2Status: player2Status ?? _player2Status,
        gameValue: gameValue ?? _gameValue,
        isXTurn: isXTurn ?? _isXTurn,
      );

  String? get id => _id;
  String? get entryFee => _entryFee;
  String? get winningPrice => _winningPrice;
  String? get drawMatch => _drawMatch;
  UserModel? get player1 => _player1;
  UserModel? get player2 => _player2;
  String? get gameStatus => _gameStatus;
  String? get player1Status => _player1Status;
  String? get player2Status => _player2Status;
  List<String>? get gameValue => _gameValue;
  bool? get isXTurn => _isXTurn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['entryFee'] = _entryFee;
    map['winningPrice'] = _winningPrice;
    map['drawMatch'] = _drawMatch;
    map['player1'] = _player1 != null ? _player1!.toJson() : null;
    map['player2'] = _player2 != null ? _player2!.toJson() : null;
    map['gameStatus'] = _gameStatus;
    map['player1Status'] = _player1Status;
    map['player2Status'] = _player2Status;
    map['gameValue'] = _gameValue;
    map['isXTurn'] = _isXTurn;
    return map;
  }
}


//25:00