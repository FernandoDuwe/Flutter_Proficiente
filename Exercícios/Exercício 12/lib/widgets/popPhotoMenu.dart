import 'package:flutter/material.dart';

typedef PopPhotoMenuOnSelect = void Function(dynamic selectedOption);

class PopPhotoMenu extends StatelessWidget {
  final Widget child;
  final PopPhotoMenuOnSelect onSelect;

  const PopPhotoMenu({required this.child, required this.onSelect, Key? key}) : super(key: key);

  PopupMenuItem _renderButtonItem(IconData prIcon, String prText, dynamic prOption) {
    return PopupMenuItem(
        value: prOption,
        child: Row(
          children: [
            Icon(prIcon),
            SizedBox(width: 10),
            Text(prText),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        tooltip: "Clique aqui para exibir as opções de imagem",
        child: this.child,
        onSelected: (value) => this.onSelect(value),
        itemBuilder: (context) {
          return [
            this._renderButtonItem(Icons.remove_red_eye, "Ver foto", "/viewPhoto"),
            this._renderButtonItem(Icons.camera, "Carregar imagem da câmera", "/uploadFromCamera"),
            this._renderButtonItem(Icons.upload, "Carregar imagem da galeria", "/uploadFromFile"),
          ];
        },
    );
  }
}
