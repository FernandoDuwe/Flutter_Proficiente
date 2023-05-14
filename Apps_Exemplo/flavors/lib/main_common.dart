import 'package:flavors/config/appConfig.dart';
import 'package:flavors/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void mainCommon(AppConfig config) {
  runApp(Provider<AppConfig>(
    create: (context) => config,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = Provider.of<AppConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.appType == AppType.desenv,
      title: config.title,
      home: HomeScreen(),
    );
  }
}
