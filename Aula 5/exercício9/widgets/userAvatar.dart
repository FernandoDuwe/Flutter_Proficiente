import "package:chat_proway/models/userModel.dart";
import "package:flutter/material.dart";

class UserAvatar extends StatelessWidget {
  final UserModel user;
  final double? radius;

  const UserAvatar({ required this.user, this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    if (user.avatarImage.isEmpty)
      return CircleAvatar(
        maxRadius: this.radius,
        child: Icon(Icons.person),
      );

    return CircleAvatar(
      maxRadius: this.radius,
      backgroundImage: NetworkImage(user.avatarImage),
    );
  }
}
