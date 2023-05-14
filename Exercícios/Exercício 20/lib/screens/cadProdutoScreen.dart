import 'package:admin_page/stores/produtoStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadProdutoScreen extends StatelessWidget {
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  late ProdutoStore produtoStore;

  void _saveClick(BuildContext context) {
    produtoStore.save().then(
        (value) => Navigator.of(context).pushReplacementNamed("/produto"));
  }

  CadProdutoScreen(String documentId) {
    this.produtoStore = ProdutoStore();

    this.produtoStore.setDocumentId(documentId).then((value) {
      this.nomeController.text = this.produtoStore.nome;
      this.precoController.text = this.produtoStore.preco.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de produtos"),
          actions: [
            Observer(builder: (context) {
              if (this.produtoStore.processing)
                return CircularProgressIndicator();

              return IconButton(
                  onPressed: (produtoStore.canSave
                      ? () => this._saveClick(context)
                      : null),
                  icon: Icon(Icons.save));
            })
          ],
        ),
        body: Observer(
          builder: (context) {
            return ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.gif_box_sharp,
                    size: 64,
                    color: Colors.green,
                  ),
                  title: Text("Produto"),
                  subtitle: Text("Cadastro de produtos"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: this.nomeController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => this.produtoStore.setNome(value),
                    decoration: InputDecoration(labelText: "Nome do produto"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: this.precoController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => this.produtoStore.setPreco(value),
                    decoration: InputDecoration(labelText: "Preço do produto"),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
