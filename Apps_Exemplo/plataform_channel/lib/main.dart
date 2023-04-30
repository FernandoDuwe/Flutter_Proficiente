import 'package:flutter/material.dart';
import 'package:plataform_channel/screens/eventScreen.dart';
import 'package:plataform_channel/screens/homeScreen.dart';
import 'package:plataform_channel/screens/javascriptScreen.dart';
import 'package:plataform_channel/screens/methodScreen.dart';

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
        "/method": (context) => MethodScreen(),
        "/event": (context) => EventScreen(),
        "/js": (context) => JavascriptScreen(),
      },
    );
  }
}
