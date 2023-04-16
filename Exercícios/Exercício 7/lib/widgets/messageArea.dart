import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/messageRepository.dart';
import 'package:flutter/material.dart';

import '../models/messageModel.dart';

class MessageArea extends StatefulWidget {
  final UserModel destinyUser;

  const MessageArea({required this.destinyUser, Key? key}) : super(key: key);

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {
  TextEditingController messageController = new TextEditingController();
  String _message = "";

  void Internal_SendMessage() {
    MessageRepository.addMessage(MessageModel.textMessage("fernando_duwe", widget.destinyUser.userName, this._message));
    
    this.messageController.text = "";
  }

  bool get canSend => this._message != "";

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
              child: TextField(
                textInputAction: TextInputAction.send,
                onSubmitted: (value) {
                  this._message = value;

                  this.Internal_SendMessage();
                },
                controller: this.messageController,
                onChanged: (value) {
                  setState(() {
                    this._message = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: "Digite aqui a sua mensagem",
                    border: InputBorder.none),
              )),
          IconButton(onPressed: (this.canSend ? this.Internal_SendMessage : null), icon: Icon(Icons.send, color: (this.canSend ? Colors.green : Colors.grey),))
        ],
      ),
    );
  }
}

