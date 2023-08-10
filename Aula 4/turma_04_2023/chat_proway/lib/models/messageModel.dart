import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String origin = "";
  String destiny = "";
  String messageType = "text";
  String messageText = "";
  String param = "";
  Timestamp timestamp = Timestamp.now();

  MessageModel.asText({required this.origin, required this.destiny, required this.messageText}) {
    this.messageType = "text";
    this.param = "";
  }

  MessageModel.asImage({required this.origin, required this.destiny, required this.param}) {
    this.messageText = "";
    this.messageType = "image";
  }

  MessageModel.fromJSON(Map<String, dynamic> prJSON) {
    this.origin = prJSON["origin"];
    this.destiny = prJSON["destiny"];
    this.messageType = prJSON["messageType"];
    this.messageText = prJSON["messageText"];
    this.param = prJSON["param"];
    this.timestamp = prJSON["timestamp"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "origin": this.origin,
      "destiny": this.destiny,
      "messageType": this.messageType,
      "messageText": this.messageText,
      "param": this.param,
      "timestamp": this.timestamp
    };
  }

  bool canShowMessage(String prOriginUser, String prDestinyUser) {
    return ((this.origin == prOriginUser) && (this.destiny == prDestinyUser)) || ((this.origin == prDestinyUser) && (this.destiny == prOriginUser));
  }
}