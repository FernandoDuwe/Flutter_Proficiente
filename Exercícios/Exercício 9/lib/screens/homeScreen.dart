import 'package:chat/repositories/userRepository.dart';
import 'package:chat/stores/userStore.dart';
import 'package:chat/widgets/userTile.dart';
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
            Observer(
              builder: (context) {
                if (!Provider.of<UserStore>(context).existsUser)
                  return CircularProgressIndicator();

                return IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/profile"),
                    icon: Icon(Icons.account_circle));
              },
            )
          ],
        ),
        body: Observer(
          builder: (context) {
            if (!Provider.of<UserStore>(context).existsUser)
              return CircularProgressIndicator();

            return FutureBuilder(
              future: UserRepository.getUsers(Provider.of<UserStore>(context).currentUserName),
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
            );
          },
        ));
  }
}
