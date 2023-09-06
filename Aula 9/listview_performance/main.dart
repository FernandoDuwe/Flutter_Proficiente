import "package:flutter/material.dart";
import "package:listview_performance/screens/dynamicListScreen.dart";
import "package:listview_performance/screens/homeScreen.dart";
import "package:listview_performance/screens/homeScreenBuilder.dart";
import "package:listview_performance/screens/loadingListScreen.dart";
import "package:listview_performance/screens/starWarsPersonScreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarWarsPersonScreen(),
    );
  }
}
