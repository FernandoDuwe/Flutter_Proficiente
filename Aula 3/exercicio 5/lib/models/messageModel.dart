import 'package:chat_proway/consts/chatType.dart';

class MessageModel {
  late String origin;
  late String destiny;
  late String messageType;
  late String messageText;
  late String param;

  MessageModel(
      {required this.origin,
      required this.destiny,
      required this.messageType,
      required this.messageText,
      required this.param});

  // Serializando o objeto
  MessageModel.fromJson(MapJson json) {
    this.origin = json["origin"];
    this.destiny = json["destiny"];
    this.messageType = json["messagetype"];
    this.messageText = json["messagetext"];
    this.param = json["param"];
  }
}
