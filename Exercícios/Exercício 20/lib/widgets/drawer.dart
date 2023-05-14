import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/adminConfig.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminConfig config = Provider.of<AdminConfig>(context);

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
            onTap: () => Navigator.of(context).pushNamed("/produto"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Usuários"),
            subtitle: Text("Cadastro de usuáris"),
            onTap: () => Navigator.of(context).pushNamed("/usuario"),
          ),
          (config.showExperimentalOptions
              ? ListTile(
                  leading: Icon(Icons.person_pin_circle),
                  title: Text("Clientes"),
                  subtitle: Text("Cadastro de clientes"),
                  onTap: () => Navigator.of(context).pushNamed("/cliente"),
                )
              : Container())
        ],
      ),
    );
  }
}
