import "package:chat_proway/screens/createUserScreen.dart";
import "package:chat_proway/screens/homePage.dart";
import "package:chat_proway/stores/userStore.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.mark_chat_unread_rounded,
              color: Colors.lightGreen,
              size: 128,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: userController,
                decoration: InputDecoration(labelText: "Usuário"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  Provider.of<UserStore>(context, listen: false)
                      .getUserByUserName(userController.text)
                      .then((value) {
                    if (value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Atenção"),
                              content: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 64,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                        "O usuário informado ainda não está cadastrado."),
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("Ok"))
                              ],
                            );
                          });
                    }
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.supervised_user_circle),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Login")
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Ainda não tem cadastro?"),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateUserScreen(),
                  ));
                },
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
