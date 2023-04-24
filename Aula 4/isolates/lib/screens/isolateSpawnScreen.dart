import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateSpawnScreen extends StatelessWidget {
  const IsolateSpawnScreen({Key? key}) : super(key: key);

  void count(int prCountTo) {
    for(var i = 0; i <= prCountTo; i++)
      print(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compute"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
              Isolate.spawn<int>(count, 100000);
            }, child: Text("Executar"))
          ],
        ),
      ),
    );
  }
}
