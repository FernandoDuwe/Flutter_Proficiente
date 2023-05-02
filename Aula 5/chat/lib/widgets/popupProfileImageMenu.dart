import 'package:flutter/material.dart';

typedef PopupProfileImageMenuOnClick = void Function(String prSelectedOption);

class PopupProfileImageMenu extends StatelessWidget {
  final Widget child;
  final PopupProfileImageMenuOnClick onClick;

  const PopupProfileImageMenu({required this.child, required this.onClick, Key? key}) : super(key: key);

  PopupMenuItem _getMenuItem(
      BuildContext context, String prValue, String prTitle, Icon prIcon) {
    return PopupMenuItem(
        value: prValue,
        child: Row(
          children: [prIcon, SizedBox(width: 20), Text(prTitle)],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        child: this.child,
        tooltip: "Clique aqui para exibir opções referentes a imagem atual",
        onSelected: (value) => this.onClick(value),
        itemBuilder: (context) {
          return [
            this._getMenuItem(context, "viewPhoto", "Ver foto",
                Icon(Icons.remove_red_eye_outlined)),
            this._getMenuItem(context, "loadFromCamera",
                "Carregar imagem da camera", Icon(Icons.camera)),
            this._getMenuItem(context, "loadFromGallery",
                "Carregar imagem da galeria", Icon(Icons.browse_gallery))
          ];
        });
  }
}
