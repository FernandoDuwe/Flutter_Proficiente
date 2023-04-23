import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/messageRepository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/messageModel.dart';
import '../stores/userStore.dart';

class ImageSelector extends StatelessWidget {
  final UserModel destinyUser;

  const ImageSelector({required this.destinyUser, super.key});

  Future<void> Internal_UploadPhoto(BuildContext context, ImageSource prSource) async {
    ImagePicker vrPicker = ImagePicker();

    XFile? vrFile = await vrPicker.pickImage(source: prSource);

    if (vrFile != null) {
      String vrURL = await MessageRepository.uploadFile(vrFile);

      MessageRepository.addMessage(MessageModel.imagemMessage(
          Provider.of<UserStore>(context, listen: false).currentUserName,
          this.destinyUser.userName,
          vrURL));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Câmera"),
            subtitle: Text("Imagem a partir da câmera"),
            onTap: () => this.Internal_UploadPhoto(context, ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text("Upload de imagem"),
            subtitle: Text("Carregar uma imagem já existente"),
            onTap: () => this.Internal_UploadPhoto(context, ImageSource.gallery),
          )
        ],
      ),
    );
  }
}
