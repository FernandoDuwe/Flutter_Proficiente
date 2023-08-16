import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/widgets/messageTile.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final UserModel origin;
  final UserModel destiny;

  const ChatPage({required this.origin, required this.destiny, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(user: destiny),
      ),
      body: FutureBuilder(
        future: MessageRepository.getChatMessages(origin, destiny),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                "Erro ao baixar as mensagens de chat: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => MessageTile(
                  message: snapshot.data![index],
                  origin: origin,
                  destiny: destiny));
        },
      ),
    );
  }
}
