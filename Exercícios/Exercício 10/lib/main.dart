import 'package:chat/screens/homeScreen.dart';
import 'package:chat/screens/profileScreen.dart';
import 'package:chat/stores/userStore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyANBpzQrOg83hVUpbXbA0xDAKB1Ly89ys4",
        appId: "1:1068962687861:web:79809d1da5612dc4d9413c",
        messagingSenderId: "1068962687861",
        projectId: "chat-proway",
        storageBucket: "chat-proway.appspot.com"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<UserStore>(
      create: (context) => new UserStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        theme: ThemeData.dark(useMaterial3: true),
        routes: {
          "/": (context) => HomeScreen(),
          "/profile": (context) => ProfileScreen(),
        },
      ),
    );
  }
}
