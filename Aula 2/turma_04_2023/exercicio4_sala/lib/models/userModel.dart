class UserModel {
  String userName = "";
  String nickName = "";
  String avatarImage = "";

  // Desserealizando os dados
  UserModel.fromJSON(Map<String, dynamic> prJson) {
    this.userName = prJson["username"];
    this.nickName = prJson["nickname"];
    this.avatarImage = prJson["avatarImage"];
  }

  // Serealizar os dados
  Map<String, dynamic> toJson() {
    return {
      "username": this.userName,
      "nickname": this.nickName,
      "avatarImage": this.avatarImage
    };
  }
}