import 'package:admin_page/widgets/drawer.dart';
import 'package:admin_page/widgets/tileCollection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      drawer: AdminDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "Bem vindo ao Admin system. Com o sistema, você poderá controlar toda a sua loja."),
          ),
          TileCollection(
            title: "Produtos",
            count: 0,
            icon: Icon(
              Icons.gif_box_sharp,
              size: 64,
              color: Colors.green,
            ),
            route: "/produto",
          ),
        ],
      ),
    );
  }
}
