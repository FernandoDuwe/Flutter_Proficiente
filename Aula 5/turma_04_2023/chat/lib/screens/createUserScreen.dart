import 'package:chat_proway/stores/createUserStore.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/backgroundGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserStore createUserStore = CreateUserStore();

  CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Criar um novo usuário"),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          BackgroundGradient(),
          Center(
            child: Card(
              elevation: 50,
              child: Observer(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_reaction_outlined,
                              color: Colors.yellowAccent,
                            ),
                            SizedBox(width: 30,),
                            Text("Cadastrar um novo usuário")
                          ],
                        ),
                        SizedBox(height: 50),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: TextField(
                            onChanged: (value) =>
                                this.createUserStore.setUserName(value),
                            decoration:
                                InputDecoration(labelText: "Nome do usuário"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: TextField(
                            onChanged: (value) =>
                                this.createUserStore.setNickName(value),
                            decoration: InputDecoration(labelText: "Nickname"),
                          ),
                        ),
                        SizedBox(height: 50),
                        (this.createUserStore.hasError
                            ? Text(
                                this.createUserStore.errorMessage,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(
                                width: 0,
                              )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: TextButton(
                              onPressed: (this.createUserStore.canSave
                                  ? () async {
                                      await this.createUserStore.save();

                                      if (this.createUserStore.saved) {
                                        Provider.of<CurrentUserStore>(context,
                                                listen: false)
                                            .setUserName(
                                                this.createUserStore.userName);

                                        Navigator.of(context)
                                            .pushReplacementNamed("/");
                                      }
                                    }
                                  : null),
                              child: (this.createUserStore.processing
                                  ? CircularProgressIndicator()
                                  : Text("Salvar"))),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
