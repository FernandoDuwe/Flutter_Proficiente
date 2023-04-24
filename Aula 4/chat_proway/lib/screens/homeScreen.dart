import 'package:chat_proway/repositories/userRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/userTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
        actions: [
          Observer(builder: (context) {
            if (!Provider.of<CurrentUserStore>(context).currentUserHasDocument)
              return CircularProgressIndicator();

            return IconButton(
                onPressed: () => Navigator.of(context).pushNamed("/me"),
                icon: Icon(Icons.person_pin));
          },)
        ],
      ),
      body: FutureBuilder(
        future: UserRepository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(snapshot.error.toString(),
                  style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => UserTile(
                    user: snapshot.data![index],
                  ));
        },
      ),
    );
  }
}
