import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/bottomMessageForm.dart';
import 'package:chat_proway/widgets/messageTile.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final UserModel destiny;
  String origin = "";

  ChatScreen({required this.destiny, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.origin = Provider.of<CurrentUserStore>(context).userName;

    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(destiny: this.destiny),
      ),
      bottomNavigationBar: BottomMessageForm(destiny: this.destiny),
      body: FutureBuilder(
        future:
            MessageRepository.getMessages(this.origin, this.destiny.userName),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          if ((snapshot.hasData) && (snapshot.data!.length == 0))
            return Center(
              child: Text(
                  "Mande um olá para ${this.destiny.nicKName} (@${this.destiny.userName}) e comece a conversar :p"),
            );

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => MessageTile(message: snapshot.data![index]),);
        },
      ),
    );
  }
}
