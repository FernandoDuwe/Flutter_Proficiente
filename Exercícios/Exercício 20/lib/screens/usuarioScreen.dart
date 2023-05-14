import 'package:admin_page/screens/cadUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              labelText: "Pesquisar",
              border: InputBorder.none
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadUserScreen()));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return ListView();
        },
      ),
    );
  }
}
