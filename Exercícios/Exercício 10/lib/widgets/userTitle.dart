import 'package:chat/models/userModel.dart';
import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {
  final UserModel user;

  const UserTitle({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(this.user.avatarImage),
        ),
        SizedBox(
          width: 20,
        ),
        Text(this.user.nicKName)
      ],
    );
  }
}
