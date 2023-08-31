import 'package:chat_proway/consts/chatType.dart';

class UserModel {
  String id = "";
  late String userName;
  late String nickName;
  late String avatarImage;

  UserModel(
      {required this.userName,
      required this.nickName,
      required this.avatarImage});

  // Deserializar
  UserModel.fromJson(MapJson json, [ String docId = "" ]) {
    this.id = docId;

    this.userName = json["username"];
    this.nickName = json["nickname"];
    this.avatarImage = json["avatarimage"];
  }

  MapJson toJson() {
    return {
      "username": this.userName,
      "nickname": this.nickName,
      "avatarimage": this.avatarImage
    };
  }

  bool get newUser => this.id == "";
}
