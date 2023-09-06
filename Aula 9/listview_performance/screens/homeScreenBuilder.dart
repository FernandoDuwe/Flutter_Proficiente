import "package:flutter/material.dart";

class HomeScreenBuilder extends StatefulWidget {
  const HomeScreenBuilder({super.key});

  @override
  State<HomeScreenBuilder> createState() => _HomeScreenBuilderState();
}

class _HomeScreenBuilderState extends State<HomeScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
          prototypeItem: ListTile(
            title: Text("Prototipo"),
            trailing: Icon(Icons.numbers),
          ),
          itemCount: 1000,
          itemBuilder: (context, index) {
            print(index);

            return ListTile(
              title: Text(index.toString()),
              trailing: Icon(Icons.numbers),
            );
          },),
    );
  }
}
