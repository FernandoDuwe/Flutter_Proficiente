import "package:chat_proway/screens/myProfileScreen.dart";
import "package:chat_proway/stores/userStore.dart";
import "package:chat_proway/widgets/userAvatar.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (Provider.of<UserStore>(context).currentUser == null)
          return CircularProgressIndicator();

        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyProfileScreen(
                  user: Provider.of<UserStore>(context).currentUser!,
                ),
              ));
            },
            child: UserAvatar(
              user: Provider.of<UserStore>(context).currentUser!,
            ));
      },
    );
  }
}
