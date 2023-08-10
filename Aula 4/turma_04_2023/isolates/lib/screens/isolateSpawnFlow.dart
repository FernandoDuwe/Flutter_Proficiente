import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateSpawnFlow extends StatefulWidget {
  const IsolateSpawnFlow({Key? key}) : super(key: key);

  Future<void> count(int prCountTo) async {
    for(var i = 0; i <= prCountTo; i++) {
      print(i);

      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  @override
  State<IsolateSpawnFlow> createState() => _IsolateSpawnFlowState();
}

class _IsolateSpawnFlowState extends State<IsolateSpawnFlow> {
  Isolate? isolate;
  Capability? capability;

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
            ElevatedButton(onPressed: () async {
              this.isolate = await Isolate.spawn<int>(widget.count, 100000);
            }, child: Text("Iniciar")),
            ElevatedButton(onPressed: () {
              this.capability = this.isolate!.pause(this.isolate!.pauseCapability);

            }, child: Text("Pausar")),
            ElevatedButton(onPressed: () {
              this.isolate!.resume(this.capability!);
            }, child: Text("Resumir")),
            ElevatedButton(onPressed: () {
              this.isolate!.kill();
            }, child: Text("Matar thread")),
          ],
        ),
      ),
    );
  }
}
