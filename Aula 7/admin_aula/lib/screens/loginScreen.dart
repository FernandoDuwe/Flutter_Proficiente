import 'dart:math';

import 'package:admin_sala/stores/loginStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  LoginStore login = LoginStore();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> _login(BuildContext context) async {
    await login.login();

    if (!login.possuiErro)
      Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) => login.setEmail(value),
                      decoration: InputDecoration(
                        labelText: "E-mail"
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      onChanged: (value) => login.setSenha(value),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha"
                      ),
                    ),
                    SizedBox(height: 30,),
                    Observer(builder: (context) {
                      if (login.possuiErro)
                        return Text(login.mensagemErro, style: TextStyle(color: Colors.red),);

                      return Container();
                    },),
                    Observer(builder: (context) {
                      if (login.processando)
                        return CircularProgressIndicator();

                      return ElevatedButton(onPressed: !login.podeEfetuarLogin ? null : () => this._login(
                          context), child: Text("Login"));
                    },)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
