import 'package:flutter/material.dart';
import 'package:plataform_channel/channels/methodChannelTest.dart';

class MethodChannelScreen extends StatelessWidget {
  MethodChannelTest _test = MethodChannelTest();

  MethodChannelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method Channel"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              this._test.helloWorld().then((value) => print(value));
            }, child: Text("Hellor World")),
            TextButton(onPressed: () {
              this._test.sayHello("Proway").then((value) => print(value));
            }, child: Text("Say hello to..."))
          ],
        ),
      ),
    );
  }
}
