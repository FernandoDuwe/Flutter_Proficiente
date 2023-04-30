import 'package:flutter/material.dart';

import '../channels/methodChannel.dart';

class MethodScreen extends StatefulWidget {
  const MethodScreen({Key? key}) : super(key: key);

  @override
  State<MethodScreen> createState() => _MethodScreenState();
}

class _MethodScreenState extends State<MethodScreen> {
  String _text = "";
  MethodChanelTest channel = MethodChanelTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MethodChannel"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          this._text = await this.channel.getMessage();

          setState(() {

          });
        },
        child: Icon(Icons.message),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mensagem: ${this._text}"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              this._text = await this.channel.getMessageWithParams("Proway");

              setState(() {

              });
            }, child: Text("Teste com parâmetro"))
          ],
        ),
      ),
    );
  }
}
