import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/stores/messageStore.dart';
import 'package:chat_proway/stores/userStore.dart';
import 'package:chat_proway/widgets/messageForm.dart';
import 'package:chat_proway/widgets/messageTile.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final UserModel origin;
  final UserModel destiny;
  late MessageStore store;

  ChatPage({required this.origin, required this.destiny, super.key}) {
    store = new MessageStore();

    store.origin = origin.userName;
    store.destiny = destiny.userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(user: destiny),
      ),
      body: Observer(
        builder: (context) {
          if (store.messages.length == 0)
            return Center(
              child: Text("Mande a primeira mensagem ;)"),
            );

          return ListView.builder(
            reverse: true,
            itemCount: store.messages.length,
            itemBuilder: (context, index) {
              return MessageTile(
                  message: store.messages[index],
                  origin: origin,
                  destiny: destiny);
            },
          );
        },
      ),
      bottomNavigationBar: MessageForm(
        origin: origin,
        destiny: destiny,
      ),
    );
  }
}
