import 'package:flutter/material.dart';

class CountNormalScreen extends StatelessWidget {
  const CountNormalScreen({Key? key}) : super(key: key);

  void count(int prCountTo) {
    for(var i = 0; i <= prCountTo; i++)
      print(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count normal"),
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
              this.count(100000);
            }, child: Text("Executar"))
          ],
        ),
      ),
    );
  }
}
