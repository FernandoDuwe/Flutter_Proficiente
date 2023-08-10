import 'package:flutter/material.dart';
import 'package:list_view_performance/models/recordMockModel.dart';
import 'package:list_view_performance/stores/listStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  ListStore store = ListStore();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
              prototypeItem: ListTile(
                title: Text(""),
                subtitle: Text(""),
              ),
              itemCount: store.registros.length + 1,
              itemBuilder: (context, index) {
                if (index >= store.registros.length) {
                  if (store.ehUltimaPagina)
                    return Container(
                      alignment: Alignment.center,
                      height: 32,
                      child: Text("Sem registros mais a exibir"),
                    );

                  print("Hora de disparar a paginação");

                  store.irProximaPagina();

                  return Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return ListTile(
                  title: Text(store.registros[index].nome),
                  subtitle: Text(store.registros[index].valor),
                );
              });
        },
      ),
    );
  }
}
