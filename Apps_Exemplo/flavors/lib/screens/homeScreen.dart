import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/appConfig.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = Provider.of<AppConfig>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            child: Image(
              image: NetworkImage(config.folderImg),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text("Bem vindo!"),
            subtitle: Text(config.typeString),
          )
        ],
      ),
    );
  }
}
