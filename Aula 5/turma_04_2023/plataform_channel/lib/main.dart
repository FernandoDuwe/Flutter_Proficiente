import 'package:flutter/material.dart';
import 'package:plataform_channel/channels/eventChannelTest.dart';
import 'package:plataform_channel/screens/eventChannelScreen.dart';
import 'package:plataform_channel/screens/jsCodeScreen.dart';
import 'package:plataform_channel/screens/methodChannelScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JSCodeScreen(),
    );
  }
}
