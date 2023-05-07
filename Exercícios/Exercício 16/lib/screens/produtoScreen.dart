import 'package:admin_page/screens/cadProdutoScreen.dart';
import 'package:flutter/material.dart';

class ProdutoScreen extends StatelessWidget {
  const ProdutoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto"),
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
    );
  }
}
