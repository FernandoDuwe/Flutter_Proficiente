import "package:flutter/material.dart";
import "package:listview_performance/models/productModel.dart";
import "package:listview_performance/widgets/productListTile.dart";

class LoadingListScreen extends StatelessWidget {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(seconds: 5));

    return [
      ProductModel(
          title: "Mustang",
          subtitle: "Ford Mustang",
          image:
              "https://i0.statig.com.br/bancodeimagens/imgalta/65/9z/va/659zvas78mzs2jmicpnkqcxqa.jpg"),
      ProductModel(
          title: "Dino",
          subtitle: "Ferrari Dino",
          image:
              "https://quatrorodas.abril.com.br/wp-content/uploads/2017/05/ferrari-dino-2.jpg?quality=70&strip=info"),
      ProductModel(
          title: "Porshe 918",
          subtitle: "Híbrido",
          image:
              "https://quatrorodas.abril.com.br/wp-content/uploads/2016/11/56e1e7d982bee10ed506bbbeqr-679-porsche-11-tif-e1493157622637.jpeg?quality=70&strip=info")
    ];
  }

  const LoadingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView - Aguardando recebimento"),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ProductListTile(
                  titulo: "Aguarde...",
                  subtitulo: "Buscando carros",
                  image: "",
                  loadingMode: true),
            );

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ProductModel model = snapshot.data![index];

                return ProductListTile(
                    titulo: model.title,
                    subtitulo: model.subtitle,
                    image: model.image,
                    loadingMode: false);
              });
        },
      ),
    );
  }
}
