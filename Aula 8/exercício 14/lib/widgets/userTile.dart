import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/widgets/userAvatar.dart';
import 'package:flutter/material.dart';

typedef UserTileClick = void Function(UserModel user);

class UserTile extends StatelessWidget {
  final UserModel user;
  final UserTileClick? onClick;

  const UserTile({required this.user, this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (this.onClick != null) this.onClick!(user);
      },
      leading: UserAvatar(user: user),
      title: Text(
        user.nickName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "@${user.userName}",
        style: TextStyle(color: Colors.grey, fontSize: 8),
      ),
      trailing: Icon(Icons.question_answer_outlined),
    );
  }
}
