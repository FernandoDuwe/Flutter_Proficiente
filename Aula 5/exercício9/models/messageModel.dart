import 'package:chat_proway/consts/chatType.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MessageModel {
  late String origin;
  late String destiny;
  late String messageType;
  late String messageText;
  late String param;

  MessageModel({required this.origin,
    required this.destiny,
    required this.messageType,
    required this.messageText,
    required this.param});

  MessageModel.asText({
    required this.origin,
    required this.destiny,
    required this.messageText
  }) {
    this.messageType = "text";
    this.param = "";
  }

  // Serializando o objeto
  MessageModel.fromJson(MapJson json) {
    this.origin = json["origin"];
    this.destiny = json["destiny"];
    this.messageType = json["messagetype"];
    this.messageText = json["messagetext"];
    this.param = json["param"];
  }

  // Desserealizando o objeto
  MapJson toJson() {
    return {
      "origin": this.origin,
      "destiny": this.destiny,
      "messagetype": this.messageType,
      "messagetext": this.messageText,
      "param": this.param,
      "created_at": DateTime.now()
    };
  }
}
