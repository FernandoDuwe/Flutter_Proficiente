import 'package:example/screens/homeCep.dart';
import 'package:flutter/material.dart';
import 'package:viacep_proway/viacep_proway.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercicio3(),
    );
  }
}
