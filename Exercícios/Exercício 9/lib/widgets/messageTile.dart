import 'package:chat/models/messageModel.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final MessageModel message;

  const MessageTile({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (this.message.destiny == "fernando_duwe"
          ? EdgeInsets.only(left: 10, bottom: 10)
          : EdgeInsets.only(right: 10, bottom: 10)),
      alignment: (this.message.destiny == "fernando_duwe"
          ? Alignment.topLeft
          : Alignment.topRight),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(this.message.messageText,
            style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          color: (this.message.destiny == "fernando_duwe" ? Colors.purple[600] : Colors.purple[400]),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
