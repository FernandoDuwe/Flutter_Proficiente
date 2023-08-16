import 'package:chat_proway/models/userModel.dart';
import 'package:flutter/material.dart';

typedef UserTileClick = void Function(UserModel user);

class UserTile extends StatelessWidget {
  final UserModel user;
  final UserTileClick? onClick;

  const UserTile({required this.user, this.onClick, super.key});

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
      onTap: () {
        if (this.onClick != null)
          this.onClick!(user);
      },
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
