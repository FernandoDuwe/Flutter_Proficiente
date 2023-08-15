import 'package:chat_proway/consts/chatType.dart';

class UserModel {
  late String userName;
  late String nickName;
  late String avatarImage;

  UserModel(
      {required this.userName,
      required this.nickName,
      required this.avatarImage});

  // Serializar
  UserModel.fromJson(MapJson json) {
    this.userName = json["username"];
    this.nickName = json["nickname"];
    this.avatarImage = json["avatarimage"];
  }
}
