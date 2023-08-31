import "package:chat_proway/stores/createUserStore.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

class CreateUserScreen extends StatelessWidget {
  CreateUserStore createUserStore = CreateUserStore();

  CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxSize = MediaQuery.of(context).size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre-se"),
        ),
        body: Center(
          child: Card(
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Preeencha seus dados para cadastrar-se"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 100, maxWidth: maxSize),
                      child: TextField(
                        onChanged: (value) =>
                            createUserStore.setUserName(value),
                        decoration: InputDecoration(
                            labelText:
                                "Nome de usuário (essa informação não poderá ser alterada)"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 100, maxWidth: maxSize),
                      child: TextField(
                        onChanged: (value) =>
                            createUserStore.setNickName(value),
                        decoration: InputDecoration(
                            labelText:
                                "Apelido do usuário (como você será chamado)"),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (context) {
                      if (createUserStore.loading)
                        return CircularProgressIndicator();

                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: 50, minWidth: maxSize),
                          child: ElevatedButton(
                              onPressed: (createUserStore.canSave
                                  ? () async {
                                      bool success =
                                          await createUserStore.save();

                                      print(success);

                                      if (!success) return;

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.check_circle,
                                              color: Colors.green),
                                          Text(
                                              "Usuário ${createUserStore.userName} cadastrado com sucesso!")
                                        ],
                                      )));

                                      Navigator.of(context).pop();
                                    }
                                  : null),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Cadastrar-se")
                                ],
                              )),
                        ),
                        (createUserStore.hasError
                            ? Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  createUserStore.errorMessage,
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : Container())
                      ]);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
