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
            title: Text("async"),
            onTap: () => Navigator.of(context).pushNamed("/async"),
          ),
          ListTile(
            title: Text("compute"),
            onTap: () => Navigator.of(context).pushNamed("/compute"),
          ),
          ListTile(
            title: Text("spawn"),
            onTap: () => Navigator.of(context).pushNamed("/spawn"),
          ),
          ListTile(
            title: Text("spawn complete"),
            onTap: () => Navigator.of(context).pushNamed("/spawn/complete"),
          ),
          ListTile(
            title: Text("spawn message"),
            onTap: () => Navigator.of(context).pushNamed("/spawn/message"),
          ),
        ],
      ),
    );
  }
}
