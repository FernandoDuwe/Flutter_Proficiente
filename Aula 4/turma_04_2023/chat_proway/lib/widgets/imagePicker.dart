import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/storageRepository.dart';

class ImagePickerWidget extends StatelessWidget {
  final String origin;
  final String destiny;

  const ImagePickerWidget(
      {required this.origin, required this.destiny, Key? key})
      : super(key: key);

  Future<void> _buscarImagem(BuildContext context, ImageSource prSource) async {
    ImagePicker vrPicker = ImagePicker();

    XFile? vrFile = await vrPicker.pickImage(source: prSource);

    if (vrFile != null) {
      String vrURL = await StorageRepository.uploadImage(vrFile, "messages");

      await MessageRepository.addMessage(MessageModel.asImage(
          origin: this.origin, destiny: this.destiny, param: vrURL));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => this._buscarImagem(context, ImageSource.camera),
              child: Text("Camera")),
          SizedBox(height: 20),
          TextButton(
              onPressed: () => this._buscarImagem(context, ImageSource.gallery),
              child: Text("Da galeria"))
        ],
      ),
    );
  }
}
