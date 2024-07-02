import 'dart:convert';
/// gameValue : ["","","","","","","","",""]
/// isXTurn : true

DemoModel demoModelFromJson(String str) => DemoModel.fromJson(json.decode(str));
String demoModelToJson(DemoModel data) => json.encode(data.toJson());
class DemoModel {
  DemoModel({
      List<String>? gameValue, 
      bool? isXTurn,}){
    _gameValue = gameValue;
    _isXTurn = isXTurn;
}

  DemoModel.fromJson(dynamic json) {
    _gameValue = json['gameValue'] != null ? json['gameValue'].cast<String>() : [];
    _isXTurn = json['isXTurn'];
  }
  List<String>? _gameValue;
  bool? _isXTurn;
DemoModel copyWith({  List<String>? gameValue,
  bool? isXTurn,
}) => DemoModel(  gameValue: gameValue ?? _gameValue,
  isXTurn: isXTurn ?? _isXTurn,
);
  List<String>? get gameValue => _gameValue;
  bool? get isXTurn => _isXTurn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameValue'] = _gameValue;
    map['isXTurn'] = _isXTurn;
    return map;
  }

}