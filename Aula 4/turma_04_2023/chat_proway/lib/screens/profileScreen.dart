import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController nickController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel vrUser = Provider.of<CurrentUserStore>(context).currentUser!;

    this.nickController.text = vrUser.nicKName;

    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(
          destiny: vrUser,
        ),
        actions: [
          IconButton(onPressed: () async {
            UserModel vrUser = Provider.of<CurrentUserStore>(context, listen: false).currentUser!;

            vrUser.nicKName = this.nickController.text;

            await Provider.of<CurrentUserStore>(context, listen: false).updateUser(vrUser);

            Navigator.of(context).pop();
          }, icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: CircleAvatar(
              backgroundImage: NetworkImage(vrUser.avatarImage),
              radius: 128,
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
                labelText: "Apelido do usuário"
              ),
            ),
          )
        ],
      ),
    );
  }
}
