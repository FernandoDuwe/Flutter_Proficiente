import 'package:chat_proway/screens/homePage.dart';
import 'package:chat_proway/stores/userStore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      name: "chat_proway",
      options: FirebaseOptions(
          apiKey: "AIzaSyDk8_FSwB4E2t0tEBTD-m_yp_uUylUHt0o",
          appId: "1:113968514912:web:b3893432693a26a4e04005",
          messagingSenderId: "113968514912",
          projectId: "chat-proway-72788"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        UserStore store = new UserStore();

        store.getUserByUserName("teste2");

        return store;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
