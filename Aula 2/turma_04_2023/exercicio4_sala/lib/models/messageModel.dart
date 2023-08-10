class MessageModel {
  String origin = ""; // username do usuário que enviou a mensagem
  String destiny = ""; // username do usuário que receberá a mensagem
  String messageType = ""; // texto
  String messageText = "";
  String param = "";

  // Desserealizar
  MessageModel.fromJSON(Map<String, dynamic> prJson) {
    this.origin = prJson["origin"];
    this.destiny = prJson["destiny"];
    this.messageType = prJson["messageType"];
    this.messageText = prJson["messageText"];
    this.param = prJson["param"];
  }

  // Serealizar
  Map<String, dynamic> toJSON() {
    return {
      "origin": this.origin,
      "destiny": this.destiny,
      "messageType": this.messageType,
      "messageText": this.messageText,
      "param": this.param
    };
  }

  bool mensagemDaConversa(String prOrigin, String prDestiny) {
    return ((this.origin == prOrigin) && (this.destiny == prDestiny)) ||
           ((this.origin == prDestiny)) && (this.destiny == prOrigin);
  }
}