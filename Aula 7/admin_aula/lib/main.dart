import 'package:admin_sala/screens/createUserForm.dart';
import 'package:admin_sala/screens/homeScreen.dart';
import 'package:admin_sala/screens/loginScreen.dart';
import 'package:admin_sala/screens/productForm.dart';
import 'package:admin_sala/screens/productSearch.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDRb9ix3CWMQRP7viG8gZv1a4tzrdrVcmk",
          appId: "1:21861143710:web:b5a8234566d9a20410178f",
          messagingSenderId: "21861143710",
          projectId: "admin-sala-cd4be"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/": (context) => HomeScreen(),
        "/produto/new": (context) => ProductForm(),
        "/produto": (context) => ProductSearch(),
        "/usuario": (context) => CreateUserForm(),
        "/login": (context) => LoginScreen(),
      },
    );
  }
}
