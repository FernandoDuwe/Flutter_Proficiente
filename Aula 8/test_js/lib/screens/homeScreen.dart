import "package:flutter/material.dart";
import "dart:js" as js;

class HomeScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(labelText: "Mensagem"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  js.context
                      .callMethod("showMessage", [messageController.text]);
                },
                child: Text("Enviar mensagem"))
          ],
        ),
      ),
    );
  }
}
