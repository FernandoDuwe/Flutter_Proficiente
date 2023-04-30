import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Admin System"),
          ),
          ListTile(
            leading: Icon(Icons.gif_box_sharp),
            title: Text("Produtos"),
            subtitle: Text("Cadastro de produtos"),
            onTap: () => Navigator.of(context).pushNamed("/products"),
          )
        ],
      ),
    );
  }
}
