import 'package:flavors_store/classes/appFlavor.dart';
import 'package:flavors_store/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void mainCommon(AppFlavor appFlavor) {
  runApp(Provider<AppFlavor>(
      create: (context) => appFlavor,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Provider.of<AppFlavor>(context).backgroundColor
      ),
      title: Provider.of<AppFlavor>(context).title,
      debugShowCheckedModeBanner: Provider.of<AppFlavor>(context).appInTest,
      home: HomeScreen(),
    );
  }
}

