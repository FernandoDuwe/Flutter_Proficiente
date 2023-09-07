import "package:flutter/material.dart";

class CandyDrawer extends StatelessWidget {
  const CandyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Cupcakes de sorvete"),
          ),
          ListTile(
            title: Text("Cupcakes de amora"),
          ),
          ListTile(
            title: Text("Cupcakes de bife"),
          ),
        ],
      ),
    );
  }
}
