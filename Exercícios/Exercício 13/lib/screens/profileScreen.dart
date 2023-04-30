import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:chat/stores/userStore.dart';
import 'package:chat/widgets/popPhotoMenu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nickController = TextEditingController();
  String imageURL = "";

  Future<void> Internal_Save(BuildContext context) async {
    UserModel vrUser =
        Provider.of<UserStore>(context, listen: false).currentUser!;

    vrUser.nicKName = nickController.text;
    vrUser.avatarImage = this.imageURL;

    await Provider.of<UserStore>(context, listen: false).setUser(vrUser);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    UserModel vrUser = Provider.of<UserStore>(context).currentUser!;

    nickController.text = vrUser.nicKName;

    if (this.imageURL == "")
      this.imageURL = vrUser.avatarImage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meu perfil"),
        actions: [
          IconButton(
              onPressed: () => this.Internal_Save(context),
              icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: PopPhotoMenu(
              onSelect: (selectedOption) async {
                if (selectedOption == "/viewPhoto") {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Image(
                          image: NetworkImage(this.imageURL),
                        );
                      });
                }

                if (selectedOption == "/uploadFromCamera") {
                  ImagePicker vrPicker = ImagePicker();

                  XFile? vrFile = await vrPicker.pickImage(source: ImageSource.camera);

                  if (vrFile != null) {
                    String vrNewPhoto = await UserRepository.uploadFile(vrFile);

                    setState(() {
                      this.imageURL = vrNewPhoto;
                    });
                  }
                }

                if (selectedOption == "/uploadFromFile") {
                  ImagePicker vrPicker = ImagePicker();

                  XFile? vrFile = await vrPicker.pickImage(source: ImageSource.gallery);

                  if (vrFile != null) {
                    String vrNewPhoto = await UserRepository.uploadFile(vrFile);

                    setState(() {
                      this.imageURL = vrNewPhoto;
                    });
                  }
                }
              },
              child: CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(this.imageURL),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("@${vrUser.userName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: this.nickController,
              decoration: InputDecoration(
                labelText: "Nickname",
              ),
            ),
          )
        ],
      ),
    );
  }
}
