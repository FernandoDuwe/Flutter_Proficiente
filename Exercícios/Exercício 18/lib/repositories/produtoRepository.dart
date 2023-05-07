import 'package:admin_page/models/produtoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProdutoRepository {
  static Future<void> save(ProdutoModel produto) async {
    if (produto.documentId != "") {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(produto.documentId)
          .update(produto.toJSON());
    } else {
      await FirebaseFirestore.instance
          .collection("products")
          .add(produto.toJSON());
    }
  }

  static Future<ProdutoModel> getProduto(String documentId) async {
    if (documentId == "") return ProdutoModel(nome: "", preco: 0.0);

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("products")
        .doc(documentId)
        .get();

    if (!doc.exists) return ProdutoModel(nome: "", preco: 0.0);

    return ProdutoModel.fromJSON(
        doc.data() as Map<String, dynamic>, documentId);
  }

  static Future<List<ProdutoModel>> getProdutos(String pesquisa) async {
    List<ProdutoModel> produtos = [];

    QuerySnapshot query =
        await FirebaseFirestore.instance.collection("products").get();

    query.docs.forEach((element) {
      ProdutoModel produto = ProdutoModel.fromJSON(
          element.data() as Map<String, dynamic>, element.id);

      if (produto.podeExibirPesquisa(pesquisa))
        produtos.add(produto);
    });

    return produtos;
  }
}