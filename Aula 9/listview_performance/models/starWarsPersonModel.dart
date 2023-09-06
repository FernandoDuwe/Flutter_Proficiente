class StarWarsPersonModel {
  String name = "";
  String height = "";
  String birth = "";

  StarWarsPersonModel();

  StarWarsPersonModel.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.height = json["height"];
    this.birth = json["birth_year"];
  }
}