import "package:flutter/material.dart";

class UserAvatarPopup extends StatelessWidget {
  final VoidCallback onViewPhoto;
  final VoidCallback onChangeFromCamera;
  final VoidCallback onChangeFromGallery;
  final Widget child;

  const UserAvatarPopup(
      {required this.child,
      required this.onViewPhoto,
      required this.onChangeFromCamera,
      required this.onChangeFromGallery,
      super.key});

  PopupMenuEntry _getMenuItem(
      Icon icon, String title, String subtitle, String value) {
    return PopupMenuItem(
        value: value,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [Text(title), Text(subtitle)],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == "view")
          onViewPhoto();

        if (value == "camera")
          onChangeFromCamera();

        if (value == "gallery")
          onChangeFromGallery();
      },
      tooltip: "Clique aqui para exibir as opções",
      child: this.child,
      itemBuilder: (context) {
        return [
          _getMenuItem(Icon(Icons.remove_red_eye), "Ver foto",
              "exibir a foto do usuário", "view"),
          _getMenuItem(Icon(Icons.camera_alt_outlined), "Camera",
              "Carregar da camera", "camera"),
          _getMenuItem(const Icon(Icons.browse_gallery), "Galeria",
              "Carregar da galeria", "gallery"),
        ];
      },
    );
  }
}
