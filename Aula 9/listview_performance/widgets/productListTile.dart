import "package:flutter/material.dart";

class ProductListTile extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String image;
  final bool loadingMode;

  const ProductListTile(
      {required this.titulo,
      required,
      required this.subtitulo,
      required this.image,
      required this.loadingMode,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (loadingMode) {
      return Opacity(opacity: 0.2,
        child: ListTile(
          leading: CircularProgressIndicator(),
          title: Text(this.titulo),
          subtitle: Text(this.subtitulo),
          trailing: Icon(Icons.more_horiz),
        )
      );
    }

    return ListTile(
      leading: Image.network(this.image),
      title: Text(this.titulo),
      subtitle: Text(this.subtitulo),
      trailing: Icon(Icons.more_horiz),
    );
  }
}
