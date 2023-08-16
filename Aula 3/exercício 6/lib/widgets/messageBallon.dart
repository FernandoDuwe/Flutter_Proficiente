import 'package:chat_proway/models/messageModel.dart';
import 'package:flutter/material.dart';

class MessageBallon extends StatelessWidget {
  final MessageModel message;
  final Color? backgroundColor;

  const MessageBallon({required this.message, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints: BoxConstraints(maxWidth: 300),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "@${message.origin}",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
          Text(
            message.messageText,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: (this.backgroundColor ?? Colors.purple),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
