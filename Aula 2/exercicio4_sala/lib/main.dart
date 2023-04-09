import 'package:chat_correcao/repositories/messageRepository.dart';
import 'package:chat_correcao/repositories/userRepository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDA2amnLEoBWQN7N_jq_RWBM8f93g03mmg",
        appId: "1:958198803187:web:cbc57d154535d80b6a2586",
        messagingSenderId: "958198803187",
        projectId: "chat-correcao")
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository.getUsers().then((value) {
      print(value);
    });

    MessageRepository.getMessages("fernando.duwe", "test").then((value) => print(value));

    return const Placeholder();
  }
}
