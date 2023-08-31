import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/widgets/messageBallon.dart';
import 'package:chat_proway/widgets/messageImageBallon.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final MessageModel message;
  final UserModel origin;
  final UserModel destiny;

  const MessageTile({required this.message,
    required this.origin,
    required this.destiny,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: (message.origin == origin.userName
          ? Alignment.topRight
          : Alignment.topLeft),
      child: (message.isTextMessage ? MessageBallon(
          message: message,
          backgroundColor: (message.origin == origin.userName
              ? Colors.purple
              : Colors.purpleAccent)) : MessageImageBallon(
          message: message,
          backgroundColor: (message.origin == origin.userName
              ? Colors.purple
              : Colors.purpleAccent))),
    );
  }
}
