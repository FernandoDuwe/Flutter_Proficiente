import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> _getChildren(int qtd) {
    List<Widget> list = [];

    for (int i = 0; i < qtd; i++)
      list.add(ListTile(
        title: Text(i.toString()),
        trailing: Icon(Icons.numbers),
      ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView - Performance"),
      ),
      body: ListView(
        children: _getChildren(1000),
      )
    );
  }
}
