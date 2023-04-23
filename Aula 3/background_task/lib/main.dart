import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';

@pragma("vm:entry-point")
Future<void> headlessTask(HeadlessTask prTask) async {
  String vrTaskID = prTask.taskId;
  bool vrIsTimeOut = prTask.timeout;

  if (vrIsTimeOut) {
    print("HeadlessTask: Finalizou por timeout");

    BackgroundFetch.finish(vrTaskID);
  }

  // Aqui vou executar a minha regra de negócio

  BackgroundFetch.finish(vrTaskID);
}

void main() {
  runApp(const MyApp());
  
  BackgroundFetch.registerHeadlessTask();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> onFetch(String prTaskID) async {
    print("onFetch");

    // Código aqui

    BackgroundFetch.finish(prTaskID);
  }

  Future<void> onTimeOut(String prTaskID) async {
    print("timeout");

    BackgroundFetch.finish(prTaskID);
  }

  Future<void> initPlataformState() async {
    await BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15),
        this.onFetch,
        this.onTimeOut
    );
  }


  @override
  void initState() {
    super.initState();

    this.initPlataformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
