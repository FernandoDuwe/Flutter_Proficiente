import "package:chat_proway/models/messageModel.dart";
import "package:chat_proway/models/userModel.dart";
import "package:chat_proway/repositories/messageRepository.dart";
import "package:flutter/material.dart";

class MessageForm extends StatefulWidget {
  final UserModel origin;
  final UserModel destiny;

  const MessageForm({required this.origin, required this.destiny, super.key});

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  bool sendPhoto = true;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black38,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (value) {
                setState(() {
                  this.sendPhoto = value.trim().isEmpty;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Escreva aqui a sua mensagem"),
            ),
          ),
          AnimatedCrossFade(
              firstChild: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.photo_camera, color: Colors.green)),
              secondChild: IconButton(
                  onPressed: () async {
                    await MessageRepository.sendMessage(MessageModel.asText(
                        origin: widget.origin.userName,
                        destiny: widget.destiny.userName,
                        messageText: messageController.text));

                    messageController.text = "";
                  },
                  icon: Icon(Icons.send, color: Colors.green)),
              crossFadeState: (this.sendPhoto
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond),
              duration: Duration(milliseconds: 500))
        ],
      ),
    );
  }
}
