import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/backgroundGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  String _errorMessage = "";

  Future<void> _login() async {
    if (this.userController.text.trim().isEmpty)
      throw "O nome do usuário é obrigatório";

    UserModel? vrCurrentUser =
        await UserRepository.getUserByUserName(this.userController.text);

    if (vrCurrentUser == null)
      throw "Usuário ${this.userController.text} não encontrado";

    Provider.of<CurrentUserStore>(context, listen: false);

    Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          Center(
            child: Card(
              elevation: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Informe abaixo suas credências de acesso."),
                    SizedBox(
                      height: 30,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: TextField(
                        controller: this.userController,
                        decoration:
                            InputDecoration(labelText: "Nome de usuário"),
                      ),
                    ),
                    (this._errorMessage == ""
                        ? Container(
                            width: 10,
                          )
                        : Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              this._errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50),
                      child: TextButton(
                          onPressed: () async {
                            try {
                              await this._login();
                            } catch (e) {
                              setState(() {
                                this._errorMessage = e.toString();
                              });
                            }
                          },
                          child: Text("Login")),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Ainda não possuí cadastro?"),
                        TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed("/createUser"),
                            child: Text("Cadastre-se agora")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
