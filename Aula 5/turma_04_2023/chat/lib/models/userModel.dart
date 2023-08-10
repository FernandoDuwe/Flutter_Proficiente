class UserModel {
  String userName = "";
  String nicKName = "";
  String avatarImage = "https://firebasestorage.googleapis.com/v0/b/chat-proway.appspot.com/o/others%2Fuser-no-image.png?alt=media&token=46874649-6446-4108-b71a-81d367444385";
  String documentId = "";

  UserModel({required this.userName, required this.nicKName});

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