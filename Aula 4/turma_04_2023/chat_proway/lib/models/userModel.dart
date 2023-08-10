class UserModel {
  String userName = "";
  String nicKName = "";
  String avatarImage = "";
  String documentId = "";

  UserModel.fromJSON(String prDocumentId, Map<String, dynamic> prJSON) {
    this.documentId = prDocumentId;

    this.userName = prJSON["username"];
    this.nicKName = prJSON["nickname"];
    this.avatarImage = prJSON["avatarImage"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "username": this.userName,
      "nickname": this.nicKName,
      "avatarImage": this.avatarImage
    };
  }
}