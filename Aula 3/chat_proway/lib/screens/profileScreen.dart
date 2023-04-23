import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(
          destiny: Provider.of<CurrentUserStore>(context).currentUser!,
        ),
      ),
    );
  }
}
