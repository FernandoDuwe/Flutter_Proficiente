import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/messageTextBalloon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageTile extends StatelessWidget {
  final MessageModel message;
  String origin = "";

  MessageTile({required this.message, Key? key}) : super(key: key);

  bool get isSending => (this.message.origin == this.origin);
  bool get isReceiving => (this.message.destiny == this.origin);

  @override
  Widget build(BuildContext context) {
      this.origin = Provider.of<CurrentUserStore>(context).userName;

      MessageTextBalloonType vrType = MessageTextBalloonType.sendedForMe;

      if (this.isReceiving)
        vrType = MessageTextBalloonType.receivedToMe;

      return Container(
        padding: EdgeInsets.all(10),
        alignment: (this.isSending ? Alignment.topRight : Alignment.topLeft),
        child: MessageTextBalloon(message: this.message, ballonType: vrType),
      );
  }
}
