import 'package:chat_proway/models/userModel.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({required this.user, super.key});

  Widget _getUserAvar() {
    if (user.avatarImage.isEmpty)
      return CircleAvatar(
        child: Icon(Icons.person),
      );

    return CircleAvatar(
      backgroundImage: NetworkImage(user.avatarImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _getUserAvar(),
      title: Text(
        user.userName,
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
