import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            UserRepository.getUsers().then((value) {
              for(UserModel user in value)
                print("Usuário: ${user.userName}");
            },);

            MessageRepository.getAllMessages().then((value) {
              for(MessageModel message in value)
                print("De: ${message.origin}, Para: ${message.destiny} Mensagem: ${message.messageText}");
            });
          },
          child: Text("Testar"),
        ),
      ),
    );
  }
}
