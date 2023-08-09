import 'package:flutter/material.dart';
import 'package:viacep_proway/viacep_proway.dart';

class Exercicio3 extends StatefulWidget {
  const Exercicio3({Key? key}) : super(key: key);

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  String cep = "";
  TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 3"),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextField(
                  controller: cepController,
                  decoration: InputDecoration(
                    labelText: "Número de CEP",
                    border: InputBorder.none
                  ),
                ),
              ),
              IconButton(onPressed: () {
                setState(() {
                  this.cep = cepController.text;
                });

                cepController.text = "";
              }, icon: Icon(Icons.search))
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CepDetail(cep: this.cep),
          )
        ],
      ),
    );
  }
}
