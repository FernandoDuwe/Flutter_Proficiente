import 'package:admin_sala/widgets/customDrawer.dart';
import 'package:admin_sala/widgets/resumeTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/produto/new");
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Bem vindo, usuário!",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Selecione abaixo uma opção para começar.")
              ],
            ),
          ),
          ResumeTile(
              title: "Produtos", count: 0, lead: Icon(Icons.padding_rounded))
        ],
      ),
    );
  }
}
