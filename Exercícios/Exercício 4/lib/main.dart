import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyANBpzQrOg83hVUpbXbA0xDAKB1Ly89ys4",
        appId: "1:1068962687861:web:79809d1da5612dc4d9413c",
        messagingSenderId: "1068962687861",
        projectId: "chat-proway"),
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

      },
    );
  }
}
