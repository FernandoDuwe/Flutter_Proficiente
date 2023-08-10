import 'package:admin_sala/models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  static Future<String> saveProduct(ProductModel produto) async {
    if (produto.inserting) {
      DocumentReference doc = await FirebaseFirestore.instance
          .collection("produtos")
          .add(produto.toJSON());

      return doc.id;
    } else {
      await FirebaseFirestore.instance
          .collection("produtos")
          .doc(produto.documentId)
          .update(produto.toJSON());

      return produto.documentId;
    }
  }

  static Future<ProductModel> getProduct(String documentId) async {
    if (documentId.isEmpty) return ProductModel();

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("produtos")
        .doc(documentId)
        .get();

    return ProductModel.fromJSON(doc.data() as Map<String, dynamic>, doc.id);
  }

  static Future<List<ProductModel>> getAll(String pesquisa) async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection("produtos").get();

    List<ProductModel> list = [];

    query.docs.forEach((element) {
      ProductModel product = ProductModel.fromJSON(element.data() as Map<String, dynamic>, element.id);

      if (product.podePesquisar(pesquisa))
        list.add(product);
    });

    return list;
  }
}
