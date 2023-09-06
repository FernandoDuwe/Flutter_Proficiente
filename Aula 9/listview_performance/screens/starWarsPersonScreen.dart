import "package:flutter/material.dart";
import "package:listview_performance/models/starWarsPersonModel.dart";
import "package:listview_performance/repositories/starWarsPersonRepository.dart";
import 'package:listview_performance/models/starWarsPersonModel.dart';

class StarWarsPersonScreen extends StatefulWidget {
  const StarWarsPersonScreen({super.key});

  @override
  State<StarWarsPersonScreen> createState() => _StarWarsPersonScreenState();
}

class _StarWarsPersonScreenState extends State<StarWarsPersonScreen> {
  int page = 0;
  List<StarWarsPersonModel> personList = [];

  Future<void> getNextPage() async {
    var list = await StarWarsPersonRepository.getPerson(page + 1);

    setState(() {
      page = page + 1;
      personList.addAll(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas em Star Wars"),
      ),
      body: ListView.builder(
          itemCount: personList.length + 1,
          itemBuilder: (context, index) {
            if (index >= personList.length) {
              getNextPage();

              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Aguarde..."),
                    SizedBox(
                      width: 30,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              );
            }

            StarWarsPersonModel model = personList[index];

            return ListTile(
              leading: Icon(Icons.person),
              title: Text(model.name),
              subtitle: Text("Altura: ${model.height}"),
              trailing: Text(model.birth),
            );
          },)
    );
  }
}
