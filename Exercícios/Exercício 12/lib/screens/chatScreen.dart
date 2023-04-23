import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/messageRepository.dart';
import 'package:chat/stores/messageStore.dart';
import 'package:chat/stores/userStore.dart';
import 'package:chat/widgets/messageArea.dart';
import 'package:chat/widgets/messageTile.dart';
import 'package:chat/widgets/userTile.dart';
import 'package:chat/widgets/userTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final UserModel destinyUser;
  MessageStore vrStore = MessageStore();
  ScrollController scrollController = ScrollController();

  ChatScreen({required this.destinyUser, Key? key}) : super(key: key);

  String Internal_GetUserName(BuildContext context) {
    return Provider.of<UserStore>(context, listen: false).currentUserName;
  }

  @override
  Widget build(BuildContext context) {
    vrStore.setData(this.Internal_GetUserName(context), this.destinyUser.userName);
  
    return Scaffold(
      appBar: AppBar(
        title: UserTitle(user: this.destinyUser),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
              controller: this.scrollController,
              reverse: true,
              itemCount: vrStore.messages.length,
              itemBuilder: (context, index) =>
                  MessageTile(message: vrStore.messages.reversed.toList()[index]));

          // this.sicrollController.jumpTo(this.scrollController.position.maxScrollExtent);
        },
      ),
      bottomNavigationBar: MessageArea(destinyUser: this.destinyUser),
    );
  }
}
