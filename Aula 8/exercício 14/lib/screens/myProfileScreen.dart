import "dart:js";

import "package:chat_proway/models/userModel.dart";
import "package:chat_proway/repositories/userRepository.dart";
import "package:chat_proway/stores/userStore.dart";
import "package:chat_proway/widgets/userAvatar.dart";
import "package:chat_proway/widgets/userAvatarPopup.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:provider/provider.dart";

class MyProfileScreen extends StatelessWidget {
  TextEditingController nickNameController = new TextEditingController();

  UserModel user;

  MyProfileScreen({required this.user}) {
    nickNameController.text = user.nickName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu perfil"),
        actions: [
          IconButton(
              onPressed: () {
                user.nickName = nickNameController.text;

                Provider.of<UserStore>(context, listen: false).setUser(user);

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save)),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 500,
              child: UserAvatarPopup(
                  onViewPhoto: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Avatar de @${user.userName}"),
                          content: Image.network(user.avatarImage),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Fechar"))
                          ],
                        );
                      },
                    );
                  },
                  onChangeFromCamera: () async {
                    ImagePicker picker = ImagePicker();
                    
                    XFile? file = await picker.pickImage(source: ImageSource.camera);

                    if (file != null)
                      user.avatarImage = await UserRepository.uploadAvatarImage(file);
                  },
                  onChangeFromGallery: () async {
                    ImagePicker picker = ImagePicker();

                    XFile? file = await picker.pickImage(source: ImageSource.gallery);

                    if (file != null)
                      user.avatarImage = await UserRepository.uploadAvatarImage(file);
                  },
                  child: UserAvatar(user: user, radius: 200)),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.grey,
                Colors.black12,
              ])),
            ),
            ListTile(
              leading: Icon(
                Icons.key,
                color: Colors.yellow,
              ),
              title: Text("Nome de usuário"),
              subtitle: Text(user.userName),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              subtitle: TextField(
                controller: nickNameController,
                decoration: InputDecoration(labelText: "Seu nome de usuário"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
