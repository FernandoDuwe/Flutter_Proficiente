import 'package:flutter/material.dart';
import 'dart:js' as js;

class JSCodeScreen extends StatelessWidget {
  const JSCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Javascript"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Chamar código Javascript"),
          onPressed: () {
            js.context.callMethod("sayHelloTo", ["My little friend :)"]);
          },
        ),
      ),
    );
  }
}
