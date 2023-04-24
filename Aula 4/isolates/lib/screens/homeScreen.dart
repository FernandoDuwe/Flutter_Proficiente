import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Count Normal"),
            onTap: () {
              Navigator.of(context).pushNamed("/countNormal");
            },
          ),
          ListTile(
            title: Text("Compute"),
            onTap: () {
              Navigator.of(context).pushNamed("/compute");
            },
          ),
          ListTile(
            title: Text("Spawn"),
            subtitle: Text("1º exemplo"),
            onTap: () {
              Navigator.of(context).pushNamed("/spawn");
            },
          ),
          ListTile(
            title: Text("Spawn"),
            subtitle: Text("2º exemplo: controle de fluxo"),
            onTap: () => Navigator.of(context).pushNamed("/spawn/flow"),
          )
        ],
      ),
    );
  }
}
