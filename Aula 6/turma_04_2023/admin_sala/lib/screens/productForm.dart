import 'package:admin_sala/models/productModel.dart';
import 'package:admin_sala/stores/productFormStore.dart';
import 'package:admin_sala/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductForm extends StatelessWidget {
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  ProductFormStore form = ProductFormStore();

  final String? documentId;
  final ProductModel? productModel;

  ProductForm({this.documentId, this.productModel, Key? key})
      : super(key: key) {
    if (productModel != null) {
      form.fromObject(productModel!);

      nomeController.text = productModel!.nome;
      precoController.text = productModel!.preco.toString();
    } else {
      if (documentId != null) {
        form.fromDocumentId(documentId!).then((value) {
          nomeController.text = form.nome;

          precoController.text = form.preco.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            if (form.inserindo) return Text("Novo produto");

            return Text("Editando ${form.nome}");
          },
        ),
        actions: [
          Observer(builder: (context) {
            if (form.processando) return CircularProgressIndicator();

            return IconButton(
                onPressed: (!this.form.podeSalvar
                    ? null
                    : () => this
                        .form
                        .salvar()
                        .then((value) => Navigator.of(context).pop())),
                icon: Icon(Icons.save));
          })
        ],
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nomeController,
              onChanged: (value) => this.form.setNome(value),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome do Produto"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: precoController,
              onChanged: (value) {
                this.form.setPreco((double.tryParse(value) ?? 0));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço do produto"),
            ),
          ),
          Observer(builder: (context) {
            return (form.temErro
                ? Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      form.mensagemErro,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container());
          })
        ],
      ),
    );
  }
}
