import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/storageRepository.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/widgets/popupProfileImageMenu.dart';
import 'package:chat_proway/widgets/userAppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nickController = TextEditingController();

  String _newImage = "";

  Future<void> _pickImage(ImageSource prSource) async {
    ImagePicker vrPicker = new ImagePicker();

    XFile? vrFile = await vrPicker.pickImage(source: prSource);

    if (vrFile != null) {
     String vrImage = await StorageRepository.uploadImage(vrFile!, "avatarImages");

     print("Vai mudar: ${vrImage}");

      setState(() {
         this._newImage = vrImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel vrUser = Provider.of<CurrentUserStore>(context).currentUser!;

    this.nickController.text = vrUser.nicKName;

    print("Efetuou o build");
    print("Image: ${this._newImage}");

    return Scaffold(
      appBar: AppBar(
        title: UserAppBarTitle(
          destiny: vrUser,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                UserModel vrUser =
                    Provider.of<CurrentUserStore>(context, listen: false)
                        .currentUser!;

                vrUser.nicKName = this.nickController.text;

                if (this._newImage != "")
                  vrUser.avatarImage = this._newImage;

                await Provider.of<CurrentUserStore>(context, listen: false)
                    .updateUser(vrUser);

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: PopupProfileImageMenu(
                onClick: (String prSelectedOption) {
                  if (prSelectedOption == "viewPhoto") {
                    Widget dialog = AlertDialog(
                      content: Image(image: NetworkImage((this._newImage == "" ? vrUser.avatarImage : this._newImage))),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Fechar"))
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (context) => dialog,
                    );

                    return;
                  }

                  if (prSelectedOption == "loadFromCamera") {
                    this._pickImage(ImageSource.camera);
                    return;
                  }

                  if (prSelectedOption == "loadFromGallery") {
                    this._pickImage(ImageSource.gallery);
                    return;
                  }
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage((this._newImage == "" ? vrUser.avatarImage : this._newImage)),
                  radius: 128,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("@${vrUser.userName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: this.nickController,
              decoration: InputDecoration(labelText: "Apelido do usuário"),
            ),
          )
        ],
      ),
    );
  }
}
