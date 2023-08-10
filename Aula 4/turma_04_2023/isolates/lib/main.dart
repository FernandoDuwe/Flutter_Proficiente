import 'package:flutter/material.dart';
import 'package:isolates/screens/computeScreen.dart';
import 'package:isolates/screens/countNormalScreen.dart';
import 'package:isolates/screens/homeScreen.dart';
import 'package:isolates/screens/isolateSpawnFlow.dart';
import 'package:isolates/screens/isolateSpawnScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/countNormal": (context) => CountNormalScreen(),
        "/compute": (context) => ComputeScreen(),
        "/spawn": (context) => IsolateSpawnScreen(),
        "/spawn/flow": (context) => IsolateSpawnFlow(),
      },
    );
  }
}
