import 'package:chat/models/userModel.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /*
      leading: CircleAvatar(
        backgroundImage: NetworkImage(this.user.avatarImage)
      ),
       */
      leading: CircleAvatar(
        backgroundImage: NetworkImage(this.user.avatarImage),
      ),
      title: Text(this.user.nicKName),
      subtitle: Text(this.user.userName),
      trailing: Icon(Icons.messenger_outline)
    );
  }
}
