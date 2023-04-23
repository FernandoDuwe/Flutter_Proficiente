import 'package:flutter/material.dart';
import 'package:multithreads/screens/asyncScreen.dart';
import 'package:multithreads/screens/computeScreen.dart';
import 'package:multithreads/screens/homeScreen.dart';
import 'package:multithreads/screens/spawnComplete.dart';
import 'package:multithreads/screens/spawnScreen.dart';
import 'package:multithreads/screens/spawnWithMessages.dart';

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
        "/compute": (context) => ComputeScreen(),
        "/async": (context) => AsyncScreen(),
        "/spawn": (context) => SpawnScreen(),
        "/spawn/complete": (context) => SpawnComplete(),
        "/spawn/message": (context) => SpawnWithMessages(),
      },
    );
  }
}
