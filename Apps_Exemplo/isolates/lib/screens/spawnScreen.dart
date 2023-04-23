import 'dart:isolate';

import 'package:flutter/material.dart';

class SpawnScreen extends StatefulWidget {
  const SpawnScreen({super.key});

  @override
  State<SpawnScreen> createState() => _SpawnScreenState();

  double countTo(RangeValues prRange) {
    double vrI = 0;

    for (vrI = prRange.start; vrI <= prRange.end; vrI++) print(vrI);

    return vrI;
  }
}

class _SpawnScreenState extends State<SpawnScreen> {

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
          ElevatedButton(
              onPressed: () {
                Isolate.spawn<RangeValues>(widget.countTo, RangeValues(100, 200));
              },
              child: Text("Iniciar"))
        ],
      ),
    );
  }
}
