import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/bottomMessageForm.dart';
import 'package:chat_proway/widgets/messageTile.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/chatStore.dart';

class ChatScreen extends StatelessWidget {
  final UserModel destiny;
  String origin = "";

  ChatStore vrChatStore = ChatStore();

  ChatScreen({required this.destiny, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.origin = Provider.of<CurrentUserStore>(context).userName;

    vrChatStore.setOriginDestiny(origin, destiny.userName);

    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(destiny: this.destiny),
      ),
      bottomNavigationBar: BottomMessageForm(destiny: this.destiny),
      body: Observer(
        builder: (context) {
          if (vrChatStore.messages.length == 0)
            return Center(
              child: Text(
                  "Mande um olá para ${this.destiny.nicKName} (@${this.destiny.userName}) e comece a conversar :p"),
            );

          return ListView.builder(
            reverse: true,
            itemCount: vrChatStore.messages.length,
            itemBuilder: (context, index) => MessageTile(message: vrChatStore.messages[index]),);
        },
      )
    );
  }
}
