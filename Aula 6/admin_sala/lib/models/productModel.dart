class ProductModel {
  String documentId = "";
  String nome = "";
  double preco = 0.0;

  bool get inserting => this.documentId.isEmpty;

  ProductModel({ this.nome = "", this.preco = 0.0, this.documentId = "" });

  ProductModel.fromJSON(Map<String, dynamic> prJSON, String documentId) {
    this.nome = prJSON["nome"];
    this.preco = prJSON["preco"];

    this.documentId = documentId;
  }

  Map<String, dynamic> toJSON() {
    return {
      "nome": this.nome,
      "preco": this.preco
    };
  }
}