import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/messageRepository.dart';
import 'package:chat/stores/userStore.dart';
import 'package:chat/widgets/messageArea.dart';
import 'package:chat/widgets/messageTile.dart';
import 'package:chat/widgets/userTile.dart';
import 'package:chat/widgets/userTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final UserModel destinyUser;

  const ChatScreen({required this.destinyUser, Key? key}) : super(key: key);

  String Internal_GetUserName(BuildContext context) {
    return Provider.of<UserStore>(context, listen: false).currentUserName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserTitle(user: this.destinyUser),
      ),
      body: FutureBuilder(
        future: MessageRepository.getMessages(
            this.Internal_GetUserName(context), this.destinyUser.userName),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(snapshot.error.toString(),
                  style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          if (snapshot.data!.length == 0)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  "Nenhuma mensagem para ${this.destinyUser.nicKName}. Inicie uma conversa ;)"),
            );

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  MessageTile(message: snapshot.data![index]));
        },
      ),
      bottomNavigationBar: MessageArea(destinyUser: this.destinyUser),
    );
  }
}
