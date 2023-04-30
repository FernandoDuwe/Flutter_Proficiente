import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../stores/userStore.dart';

class NewUserScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nickController = TextEditingController();

  NewUserScreen({Key? key}) : super(key: key);

  Future<void> _doSave(BuildContext context) async {
    if (this.userNameController.text.trim().isEmpty)
      throw "O campo nome do usuário é obrigatório";

    if (this.nickController.text.trim().isEmpty)
      throw "O campo apelido do usuário é obrigatório";

    UserModel? userCheckIfExists =
        await UserRepository.getUserFromUserName(this.userNameController.text);

    if (userCheckIfExists != null)
      throw "O usuário ${this.userNameController.text} já está cadastrado";

    await UserRepository.addUser(UserModel(
        userName: this.userNameController.text,
        nicKName: this.nickController.text));

    UserModel? vrCreatedUser = await UserRepository.getUserFromUserName(this.userNameController.text);

    Provider.of<UserStore>(context, listen: false).setCurrentUser(vrCreatedUser!);

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
      appBar: AppBar(
        title: Text("Novo usuário"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await this._doSave(context);
          } catch (e) {
            this._showSnackBar(context, e.toString());
          }
        },
        child: Icon(Icons.save),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("Informe os dados de cadastro do usuário"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: this.userNameController,
                decoration: InputDecoration(labelText: "Nome do usuário"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: this.nickController,
                decoration: InputDecoration(labelText: "Apelido do usuário"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
