import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/screens/chatScreen.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user.userName == Provider.of<CurrentUserStore>(context).userName)
      return Container();

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(this.user.avatarImage, cacheKey: this.user.avatarImage),
      ),
      title: Text(this.user.nicKName),
      subtitle: Text(this.user.userName),
      trailing: Icon(Icons.messenger_outline),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(destiny: user),)),
    );
  }
}
