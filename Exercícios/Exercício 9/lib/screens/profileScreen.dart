import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:chat/stores/userStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController nickController = TextEditingController();

  Future<void> Internal_Save(BuildContext context) async {
    UserModel vrUser = Provider.of<UserStore>(context, listen: false).currentUser!;

    vrUser.nicKName = nickController.text;

    await Provider.of<UserStore>(context, listen: false).setUser(vrUser);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    UserModel vrUser = Provider.of<UserStore>(context).currentUser!;

    nickController.text = vrUser.nicKName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meu perfil"),
        actions: [
          IconButton(onPressed: () => this.Internal_Save(context), icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(vrUser.avatarImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("@${vrUser.userName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: this.nickController,
              decoration: InputDecoration(
                labelText: "Nickname",
              ),
            ),
          )
        ],
      ),
    );
  }
}
