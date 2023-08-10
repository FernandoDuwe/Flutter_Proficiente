import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Row(
              children: [
                Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.amberAccent,
                  size: 64,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Admin System™", style: TextStyle(color: Colors.white),),
                      const Text("Gerencie sua loja", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.padding_rounded),
            title: Text("Produtos"),
            subtitle: Text("Clique aqui para gerenciar os seus produtos"),
          )
        ],
      ),
    );
  }
}
