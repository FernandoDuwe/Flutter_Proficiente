import 'package:admin_sala/screens/productForm.dart';
import 'package:admin_sala/stores/productSearchStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductSearch extends StatelessWidget {
  ProductSearchStore products = ProductSearchStore();

  ProductSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => products.setPesquisa(value),
          decoration: InputDecoration(
            labelText: "Pesquisar",
            border: InputBorder.none
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed("/produto/new"),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: products.produtos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.padding_rounded),
                title: Text(products.produtos[index].nome),
                subtitle: Text(products.produtos[index].preco.toString()),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductForm(
                  documentId: products.produtos[index].documentId,
                  productModel: products.produtos[index],
                ))),
              );
            },
          );
        },
      ),
    );
  }
}
