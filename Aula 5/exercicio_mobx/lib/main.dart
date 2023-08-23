import "package:exercicio_mobx_calcuc/screens/homeScreen.dart";
import "package:exercicio_mobx_calcuc/stores/calcStore.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => new CalcStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
