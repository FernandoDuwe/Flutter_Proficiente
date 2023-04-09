import 'package:chat_correcao/models/userModel.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (this.user.avatarImage == "" ?
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.no_flash_outlined, color: Colors.white),
          )
          :  CircleAvatar(
        backgroundImage: NetworkImage(this.user.avatarImage),
      )),
      title: Text(this.user.nickName),
      subtitle: Text("@${this.user.userName}", style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert),
    );
  }
}
