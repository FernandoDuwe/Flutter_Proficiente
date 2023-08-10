import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeScreen extends StatelessWidget {
  const ComputeScreen({Key? key}) : super(key: key);
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
              compute<int, void>(count, 100000);
            }, child: Text("Executar"))
          ],
        ),
      ),
    );
  }
}
