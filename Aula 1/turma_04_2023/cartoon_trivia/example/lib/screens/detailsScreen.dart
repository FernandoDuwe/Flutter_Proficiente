import 'package:cartoon_trivia/repositories/cartoonRepository.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int cartoonId;

  const DetailsScreen({required this.cartoonId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartoonRepository vrRepository = CartoonRepository();

    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: vrRepository.getById("cartoons2D", this.cartoonId),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());

              if (!snapshot.hasData)
                return CircularProgressIndicator();

              return Column(
                children: [
                  Hero(
                    tag: this.cartoonId,
                    child: Image(
                      image: NetworkImage(snapshot.data!.image),
                    ),
                  ),
                  Text(snapshot.data!.title),
                  Text("Ano de lançamento: ${snapshot.data!.year}"),
                  Text("Episódios: ${snapshot.data!.episodes}"),
                ],
              );
            },),
      ),
    );
  }
}
