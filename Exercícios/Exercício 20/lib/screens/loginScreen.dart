import 'package:admin_page/stores/loginStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  late LoginStore login;

  LoginScreen({super.key}) {
    this.login = LoginStore();
  }

  void _save(BuildContext context) {
    this.login.login().then((value) {
      if (value)
        Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => this._save(context),
        child: Icon(Icons.login),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    onChanged: (value) => this.login.setUserName(value),
                    decoration: InputDecoration(labelText: "Usuário"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    onChanged: (value) => this.login.setPassword(value),
                    decoration: InputDecoration(labelText: "Senha"),
                    obscureText: true,
                  ),
                  Observer(builder: (context) {
                    if (login.hasError)
                      return Text(this.login.messageError, style: TextStyle(color: Colors.red));

                    return Container();
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
