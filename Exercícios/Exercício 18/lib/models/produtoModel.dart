class ProdutoModel {
  String documentId = "";
  String nome = "";
  double preco = 0.0;

  ProdutoModel({required this.nome, required this.preco}) {
    this.documentId = "";
  }

  ProdutoModel.fromJSON(Map<String, dynamic> prJSON, String prDocumentId) {
    this.documentId = prDocumentId;

    this.nome = prJSON["name"];
    this.preco = prJSON["price"];
  }

  Map<String, dynamic> toJSON() {
    return {"name": this.nome, "price": this.preco};
  }

  bool podeExibirPesquisa(String pesquisa) {
    if (pesquisa.isEmpty)
      return true;

    if (nome.toUpperCase().contains(pesquisa.toUpperCase()))
      return true;

    return false;
  }
}
