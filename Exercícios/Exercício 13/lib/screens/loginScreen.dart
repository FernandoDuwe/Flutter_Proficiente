import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:chat/stores/userStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> _doLogin(BuildContext context) async {
    if (userController.text.trim().isEmpty)
      throw ("O campo nome do usuário é obrigatório");

    UserModel? vrUser = await UserRepository.getUserFromUserName(userController.text);

    if (vrUser == null)
      throw ("Nenhum usuário encontrado para: ${userController.text}");

    Provider.of<UserStore>(context, listen: false).setCurrentUser(vrUser);

    Navigator.of(context).pushReplacementNamed("/");
  }

  void _showSnackBar(BuildContext context, String prError) {
    SnackBar vrSnack = SnackBar(
        content: Text(
      prError,
      style: TextStyle(color: Colors.red),
    ));

    ScaffoldMessenger.of(context).showSnackBar(vrSnack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.login),
        onPressed: () async {
          try {
            await this._doLogin(context);
          } catch (e) {
            this._showSnackBar(context, e.toString());
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mark_chat_unread_rounded,
              color: Colors.green,
              size: 128,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Informe o nome do usuário"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: this.userController,
                decoration: InputDecoration(labelText: "Nome de usuário"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
