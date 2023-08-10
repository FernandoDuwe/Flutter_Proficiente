import 'package:admin_sala/stores/createUserStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateUserForm extends StatelessWidget {
  CreateUserStore userStore = CreateUserStore();

  CreateUserForm({Key? key}) : super(key: key);

  Future<void> _salvar(BuildContext context) async {
    userStore.salvar();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo usuário"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            this.userStore.setVisualizarSenha(!this.userStore.visualizarSenha),
        child: Icon(Icons.remove_red_eye_outlined),
      ),
      body: ListView(
        children: [
          TextField(
            onChanged: (value) => this.userStore.setEmail(value),
            decoration: InputDecoration(
                labelText: "E-mail"
            ),
          ),
          Observer(builder: (context) {
            return TextField(
              onChanged: (value) => this.userStore.setSenha(value),
              obscureText: !this.userStore.visualizarSenha,
              decoration: InputDecoration(
                  labelText: "Senha (mínimo de 6 caracteres)"
              ),
            );
          },),
          Observer(builder: (context) {
            return TextField(
              onChanged: (value) => this.userStore.setConfirmarSenha(value),
              obscureText: !this.userStore.visualizarSenha,
              decoration: InputDecoration(
                  labelText: "Confirmar Senha (mínimo de 6 caracteres)"
              ),
            );
          },),
          Observer(builder: (context) {
            if (userStore.existeErro)
              return Text(
                  userStore.mensagemErro, style: TextStyle(color: Colors.red));

            return Container();
          },),
          Observer(builder: (context) {
            return ElevatedButton(onPressed: (userStore.podeSalvar
                ? () => this._salvar(context)
                : null), child: Text("Salvar"));
          })
        ],
      ),
    );
  }
}
