import "package:flutter/material.dart";

class DynamicListScreen extends StatefulWidget {
  const DynamicListScreen({super.key});

  @override
  State<DynamicListScreen> createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  int qtdItens = 50;
  int limit = 150;

  Future<void> getNextItens(int nextCount) async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      qtdItens = qtdItens + nextCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista dinâmica"),
      ),
      body: ListView.builder(
        itemCount: qtdItens + 1,
        itemBuilder: (context, index) {
          print(index);

          if (index >= qtdItens) {
            getNextItens(50);

            return Container(
              alignment: Alignment.center,
              child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator()),
            );
          }

          return ListTile(
            leading: Icon(Icons.image),
            title: Text(index.toString()),
            trailing: Icon(Icons.ac_unit_rounded),
          );
        },
      ),
    );
  }
}
