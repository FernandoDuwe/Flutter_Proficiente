import 'package:chat/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/userStore.dart';

class MessageTile extends StatelessWidget {
  final MessageModel message;

  const MessageTile({required this.message, Key? key}) : super(key: key);

  Widget _renderMessage(BuildContext context) {
    if (message.messageType == "text")
      return Text(this.message.messageText,
          style: TextStyle(color: Colors.white));

    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return Image(
            image: NetworkImage(message.param),
          );
        },);
      },
      child: Image(
        image: NetworkImage(message.param),
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (this.message.destiny ==
              Provider.of<UserStore>(context, listen: false).currentUserName
          ? EdgeInsets.only(left: 10, bottom: 10)
          : EdgeInsets.only(right: 10, bottom: 10)),
      alignment: (this.message.destiny ==
              Provider.of<UserStore>(context, listen: false).currentUserName
          ? Alignment.topLeft
          : Alignment.topRight),
      child: Container(
        padding: EdgeInsets.all(20),
        child: this._renderMessage(context),
        decoration: BoxDecoration(
          color: (this.message.destiny ==
                  Provider.of<UserStore>(context, listen: false).currentUserName
              ? Colors.purple[600]
              : Colors.purple[400]),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
