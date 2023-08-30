import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:chat_proway/screens/chatPage.dart';
import 'package:chat_proway/stores/userStore.dart';
import 'package:chat_proway/widgets/userProfileButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../widgets/userTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Página inicial"),
          actions: [UserProfileButton()],
        ),
        body: Observer(
          builder: (context) {
            return FutureBuilder(
              future: UserRepository.getUsers(
                  Provider.of<UserStore>(context).userName),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text(
                      "Ocorreu um erro ao efetuar a requisição: ${snapshot.error}",
                      style: TextStyle(color: Colors.red),
                    ),
                  );

                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                if ((snapshot.hasData) && (snapshot.data!.isEmpty))
                  return Center(child: Text("Nenhum usuário cadastrado"));

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => UserTile(
                    user: snapshot.data![index],
                    onClick: (user) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatPage(
                            origin: Provider.of<UserStore>(context).currentUser!,
                            destiny: user),
                      ));
                    },
                  ),
                );
              },
              initialData: null,
            );
          },
        ));
  }
}
