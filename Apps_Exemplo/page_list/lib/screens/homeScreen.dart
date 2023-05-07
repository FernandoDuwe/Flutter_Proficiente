import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/listTestStore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListTestStore listStore = ListTestStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Página inicial"),
        ),
        body: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: listStore.list.length + 1,
              itemBuilder: (context, index) {
                if (index >= listStore.list.length) {
                  listStore.goToNextPage();

                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Container(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator()),
                  );
                }
                return ListTile(
                  title: Text(listStore.list[index]),
                );
              },
            );
          },
        ));
  }
}
