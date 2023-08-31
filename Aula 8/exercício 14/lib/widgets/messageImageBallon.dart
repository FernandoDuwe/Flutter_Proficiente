import "package:chat_proway/models/messageModel.dart";
import "package:flutter/material.dart";

class MessageImageBallon extends StatelessWidget {
  final MessageModel message;
  final Color? backgroundColor;

  const MessageImageBallon(
      {required this.message, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("@${message.origin}"),
                content: Image.network(message.param),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Fechar"))
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.all(10),
        child: Image.network(
          message.param,
          errorBuilder: (context, error, stackTrace) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(
                  height: 20,
                ),
                Text(error.toString())
              ],
            );
          },
        ),
        decoration: BoxDecoration(
            color: (this.backgroundColor ?? Colors.purple),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
