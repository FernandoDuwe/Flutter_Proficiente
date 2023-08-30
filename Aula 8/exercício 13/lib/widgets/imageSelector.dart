import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class ImageSelector extends StatelessWidget {
  final VoidCallback? onClickGallery;
  final VoidCallback? onClickCamera;

  const ImageSelector({ this.onClickCamera, this.onClickGallery, super.key});

  Widget? _getBtnCamera() {
    if (kIsWeb)
      return null;

    return InkWell(
      onTap: this.onClickCamera,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Icon(Icons.photo_camera),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Camera"),
                Text("Tire uma foto")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBtnGallery() {
    return InkWell(
      onTap: this.onClickGallery,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Icon(Icons.photo),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Galeria"),
                Text("Buscar imagem da sua galeria")
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: Colors.black38,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ( _getBtnCamera() ?? Container()),
          _getBtnGallery()
        ],
      ),
    );
  }
}
