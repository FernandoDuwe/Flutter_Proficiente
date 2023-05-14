import 'package:admin_page/stores/usuarioStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadUserScreen extends StatelessWidget {
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  UsuarioStore usuarioStore = UsuarioStore();

  CadUserScreen({Key? key}) : super(key: key);

  void _saveClick(BuildContext context) {
    usuarioStore.save().then(
            (value) => Navigator.of(context).pushReplacementNamed("/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de usuários"),
          actions: [
            Observer(builder: (context) {
              return IconButton(
                  onPressed: (usuarioStore.canSave
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
                    Icons.person,
                    size: 64,
                    color: Colors.green,
                  ),
                  title: Text("Usuário"),
                  subtitle: Text("Cadastro de usuários"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value) => this.usuarioStore.setUsuario(value),
                    decoration: InputDecoration(labelText: "Nome do usuário"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value) => this.usuarioStore.setUsuario(value),
                    decoration: InputDecoration(labelText: "Senha"),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
