import 'package:admin_page/models/produtoModel.dart';
import 'package:admin_page/screens/cadProdutoScreen.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProdutoModel produtoModel;

  const ProductTile({required this.produtoModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CadProdutoScreen(produtoModel.documentId))),
      leading: Icon(
        Icons.gif_box_sharp,
        color: Colors.green,
      ),
      title: Text(this.produtoModel.nome),
      subtitle: Text(this.produtoModel.preco.toString()),
    );
  }
}
