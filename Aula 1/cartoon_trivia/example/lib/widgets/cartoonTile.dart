import 'package:cartoon_trivia/model/cartoonModel.dart';
import 'package:cartoon_trivia_example/screens/detailsScreen.dart';
import 'package:flutter/material.dart';

class CartoonTile extends StatelessWidget {
  final CartonModel cartoon;

  const CartoonTile({required this.cartoon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: this.cartoon.id,
        child: Image(
          image: NetworkImage(this.cartoon.image),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(this.cartoon.title),
      subtitle: Text(this.cartoon.year.toString()),
      trailing: Icon(Icons.more_horiz),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(cartoonId: this.cartoon.id),));
      },
    );
  }
}
