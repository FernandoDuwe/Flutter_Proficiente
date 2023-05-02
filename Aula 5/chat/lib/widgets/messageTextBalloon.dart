import 'package:chat_proway/models/messageModel.dart';
import 'package:flutter/material.dart';

enum MessageTextBalloonType { sendedForMe, receivedToMe }

class MessageTextBalloon extends StatelessWidget {
  final MessageModel message;
  final MessageTextBalloonType ballonType;

  const MessageTextBalloon(
      {required this.message,
      this.ballonType = MessageTextBalloonType.sendedForMe,
      Key? key})
      : super(key: key);

  Widget _getMessageBody(BuildContext context) {
    if (this.message.messageType == "text")
      return Text(this.message.messageText,
          style: TextStyle(color: Colors.white), textAlign: TextAlign.center);

    return GestureDetector(
      child: Image(
        image: NetworkImage(this.message.param),
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.image_not_supported_outlined),
        width: 200,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Image(
                image: NetworkImage(this.message.param),
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (this.ballonType == MessageTextBalloonType.sendedForMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start),
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 500),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: this._getMessageBody(context),
          ),
          decoration: BoxDecoration(
              color: (this.ballonType == MessageTextBalloonType.receivedToMe
                  ? Colors.purple
                  : Colors.deepPurpleAccent),
              borderRadius: BorderRadius.circular(10)),
        ),
        Text("@${this.message.origin}",
            style: TextStyle(color: Colors.white, fontSize: 8),
            textAlign: (this.ballonType == MessageTextBalloonType.sendedForMe
                ? TextAlign.end
                : TextAlign.start)),
      ],
    );
  }
}
