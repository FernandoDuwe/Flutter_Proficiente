import 'package:flutter/material.dart';

class AsyncScreen extends StatelessWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  int countTo(int prCountTo) {
    var vrI = 0;

    for (vrI = 0; vrI < prCountTo; vrI++)
      print(vrI);

    return vrI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compute"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () async {
            await this.countTo(10000000);
          }, child: Text("Iniciar"))
        ],
      ),
    );
  }
}
