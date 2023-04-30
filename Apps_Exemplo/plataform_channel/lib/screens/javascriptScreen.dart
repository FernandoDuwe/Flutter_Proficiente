import 'package:flutter/material.dart';
import 'dart:js' as js;

class JavascriptScreen extends StatelessWidget {
  const JavascriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Javascript"),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              js.context.callMethod("jsNotifier", ["Teste de Mensagem"]);
            },
            child: Text("Message"),
          )
      ),
    );
  }
}
