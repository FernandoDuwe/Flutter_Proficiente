import 'dart:isolate';

import 'package:flutter/material.dart';

class SpawnComplete extends StatefulWidget {
  const SpawnComplete({super.key});

  @override
  State<SpawnComplete> createState() => _SpawnCompleteState();

  Future<double> countTo(RangeValues prRange) async {
    double vrI = 0;

    for (vrI = prRange.start; vrI <= prRange.end; vrI++) {
      await Future.delayed(Duration(seconds: 1));

      print(vrI);
    }

    return vrI;
  }
}

class _SpawnCompleteState extends State<SpawnComplete> {
  Isolate? vrI;
  Capability? vrCap;

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
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    vrI = await Isolate.spawn<RangeValues>(widget.countTo, RangeValues(1, 500));
                  },
                  child: Text("Iniciar")),
              ElevatedButton(
                  onPressed: () async {
                    vrI!.resume(vrCap!);
                  },
                  child: Text("Retornar")),
              ElevatedButton(
                  onPressed: () async {
                    vrCap = vrI!.pause(vrI!.pauseCapability);
                  },
                  child: Text("Pausar")),
              ElevatedButton(
                  onPressed: () async {
                    vrI!.kill();
                  },
                  child: Text("Matar processo")),
            ],
          )
        ],
      ),
    );
  }
}
