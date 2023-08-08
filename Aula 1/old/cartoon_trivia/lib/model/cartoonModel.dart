class CartonModel {
  String title = "";
  int year = 0;
  String image = "";
  int episodes = 0;
  int id = 0;
  List<String> creators = [];
  String rating = "";

  CartonModel.fromJSON(Map<String, dynamic> prJSON) {
    this.title = prJSON["title"];
    this.year = prJSON["year"];
    this.image = prJSON["image"];
    this.episodes = prJSON["episodes"];
    this.id = prJSON["id"];
    this.creators = prJSON["creators"];
    this.rating = prJSON["rating"];
  }
}