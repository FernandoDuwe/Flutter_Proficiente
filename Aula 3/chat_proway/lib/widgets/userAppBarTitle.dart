import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:flutter/material.dart';

class UserAppBarTitle extends StatelessWidget {
  final UserModel destiny;

  const UserAppBarTitle({required this.destiny, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(destiny.avatarImage, cacheKey: destiny.avatarImage),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Text(this.destiny.nicKName, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        Text("@${this.destiny.userName}", style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}
