import 'package:flutter/material.dart';
import 'package:view_nativa/screens/composicaoHibrida.dart';

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
        "/composicaoHibrida": (context) => ComposicaoHibrida(),
      },
    );
  }
}
