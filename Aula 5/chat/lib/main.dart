import 'package:chat_proway/screens/createUserScreen.dart';
import 'package:chat_proway/screens/homeScreen.dart';
import 'package:chat_proway/screens/loginScreen.dart';
import 'package:chat_proway/screens/profileScreen.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
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
        storageBucket: "chat-proway.appspot.com",
        projectId: "chat-proway"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<CurrentUserStore>(
      create: (context) {
        CurrentUserStore vrUser = new CurrentUserStore();
        vrUser.setUserName("test_test");

        return vrUser;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/login",
          theme: ThemeData.dark(useMaterial3: true),
          routes: {
            "/": (context) => HomeScreen(),
            "/me": (context) => ProfileScreen(),
            "/login": (context) => LoginScreen(),
            "/createUser": (context) => CreateUserScreen(),
          },
        )
    );
  }
}
