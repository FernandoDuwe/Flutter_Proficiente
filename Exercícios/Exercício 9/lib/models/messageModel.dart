import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String origin = "";
  String destiny = "";
  String messageType = "text";
  String messageText = "";
  String param = "";
  Timestamp timestamp = Timestamp.now();

  MessageModel.textMessage(String prOrigin, String prDestiny, String prMessageText) {
    this.origin      = prOrigin;
    this.destiny     = prDestiny;
    this.messageText = prMessageText;

    this.messageType = "text";
    this.param = "";
    this.timestamp = Timestamp.now();
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
      "timestamp": this.timestamp,
    };
  }

  bool canShowMessage(String prOriginUser, String prDestinyUser) {
    return ((this.origin == prOriginUser) && (this.destiny == prDestinyUser)) || ((this.origin == prDestinyUser) && (this.destiny == prOriginUser));
  }
}