import 'dart:convert';
/// id : ""
/// name : ""
/// email : ""
/// image : ""
/// totalWins : ""

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      String? id, 
      String? name, 
      String? email, 
      String? image, 
      String? totalWins,
      String? role
  }){
    _id = id;
    _name = name;
    _email = email;
    _image = image;
    _totalWins = totalWins;
    _role = role;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
    _totalWins = json['totalWins'];
    _role = json['role'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _image;
  String? _totalWins;
  String? _role;
UserModel copyWith({  String? id,
  String? name,
  String? email,
  String? image,
  String? totalWins,
  String? role,
}) => UserModel(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  image: image ?? _image,
  totalWins: totalWins ?? _totalWins,
  role: role?? _role
);
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get image => _image;
  String? get totalWins => _totalWins;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['totalWins'] = _totalWins;
    map['role'] = _role;
    return map;
  }

}