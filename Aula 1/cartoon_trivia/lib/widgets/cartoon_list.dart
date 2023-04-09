import 'package:cartoon_trivia/model/cartoonModel.dart';
import 'package:cartoon_trivia/repositories/cartoonRepository.dart';
import 'package:flutter/material.dart';

typedef CartoonListItemBuild = Widget Function(CartonModel prModel);

class CartoonList extends StatelessWidget {
  final CartoonListItemBuild itemBuild;

  const CartoonList({required this.itemBuild, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartoonRepository vrRepository = CartoonRepository();

    return FutureBuilder(
        future: vrRepository.get2D(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());

          if (!snapshot.hasData)
            return CircularProgressIndicator();

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return this.itemBuild(snapshot.data![index]);
            }
          );
        },);
  }
}
