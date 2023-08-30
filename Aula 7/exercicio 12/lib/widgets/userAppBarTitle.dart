import 'package:chat_proway/models/userModel.dart';
import 'package:flutter/material.dart';

class UserAppBarTitle extends StatelessWidget {
  final UserModel user;

  const UserAppBarTitle({ required this.user, super.key});

  Widget _getAvatar() {
    if (user.avatarImage.isEmpty)
      return Icon(Icons.person);

    return CircleAvatar(
      backgroundImage: NetworkImage(user.avatarImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        this._getAvatar(),
        SizedBox(width: 20,),
        Text(user.nickName)
      ],
    );
  }
}
