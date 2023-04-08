import 'package:chat/repositories/userRepository.dart';
import 'package:chat/widgets/userTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: FutureBuilder(
        future: UserRepository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(snapshot.error.toString(), style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => UserTile(user: snapshot.data![index],));
        },
      ),
    );
  }
}
