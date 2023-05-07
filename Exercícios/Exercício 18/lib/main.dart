import 'package:admin_page/screens/homeScreen.dart';
import 'package:admin_page/screens/produtoScreen.dart';
import 'package:admin_page/screens/usuarioScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/produto": (context) => ProdutoScreen(),
        "/usuario": (context) => UsuarioScreen(),
      },
    );
  }
}
