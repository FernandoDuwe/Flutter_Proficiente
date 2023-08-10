import 'package:flavor_sala/screens/homeScreen.dart';
import 'package:flavor_sala/utils/appConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void mainCommon(AppConfig config) {
  runApp(Provider<AppConfig>(create: (context) => config, child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = Provider.of<AppConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.isDebugMode,
      title: config.title,
      home: HomeScreen(),
    );
  }
}

