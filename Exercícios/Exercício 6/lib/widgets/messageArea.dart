import 'package:flutter/material.dart';

class MessageArea extends StatelessWidget {
  const MessageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Digite aqui a sua mensagem"
          ),
        ),
        IconButton(onPressed: () {

        }, icon: Icon(Icons.send))
      ],
    );
  }
}
