import 'package:flavor_sala/utils/appConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = Provider.of<AppConfig>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            child: Image(
              image: NetworkImage(config.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text(config.title),
            subtitle: Text(config.isDebugMode ? "App em modo de testes!" : "Seja bem vindo!"),
          )
        ],
      ),
    );
  }
}
