class MessageModel {
  String origin = "";
  String destiny = "";
  String messageType = "text";
  String messageText = "";
  String param = "";

  MessageModel.fromJSON(Map<String, dynamic> prJSON) {
    this.origin = prJSON["origin"];
    this.destiny = prJSON["destiny"];
    this.messageType = prJSON["messageType"];
    this.messageText = prJSON["messageText"];
    this.param = prJSON["param"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "origin": this.origin,
      "destiny": this.destiny,
      "messageType": this.messageType,
      "messageText": this.messageText,
      "param": this.param,
    };
  }

  bool canShowMessage(String prOriginUser, String prDestinyUser) {
    return ((this.origin == prOriginUser) && (this.destiny == prDestinyUser)) || ((this.origin == prDestinyUser) && (this.destiny == prOriginUser));
  }
}