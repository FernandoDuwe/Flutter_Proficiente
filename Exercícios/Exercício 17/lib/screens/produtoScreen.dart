import 'package:admin_page/screens/cadProdutoScreen.dart';
import 'package:admin_page/stores/produtoListStore.dart';
import 'package:admin_page/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProdutoScreen extends StatelessWidget {
  ProdutoListStore produtoListStore = ProdutoListStore();

  ProdutoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => this.produtoListStore.pesquisar(value),
          decoration: InputDecoration(
            labelText: "Pesquisar",
                border: InputBorder.none
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadProdutoScreen("")));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
              itemCount: produtoListStore.produtos.length,
              itemBuilder: (context, index) {
                return ProductTile(produtoModel: produtoListStore.produtos[index]);
              });
        },
      ),
    );
  }
}
