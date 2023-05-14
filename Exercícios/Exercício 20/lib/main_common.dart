import 'package:admin_page/config/adminConfig.dart';
import 'package:admin_page/screens/homeScreen.dart';
import 'package:admin_page/screens/loginScreen.dart';
import 'package:admin_page/screens/produtoScreen.dart';
import 'package:admin_page/screens/usuarioScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> mainCommon(AdminConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Provider<AdminConfig>(
    create: (context) => config,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminConfig config = Provider.of<AdminConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.showDebugInfo,
      initialRoute: (config.isDevelopment ? "/" : "/login"),
      routes: {
        "/": (context) => HomeScreen(),
        "/produto": (context) => ProdutoScreen(),
        "/usuario": (context) => UsuarioScreen(),
        "/login": (context) => LoginScreen(),
      },
    );
  }
}
