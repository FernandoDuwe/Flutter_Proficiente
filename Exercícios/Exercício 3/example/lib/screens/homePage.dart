import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_package/widgets/viaCepContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cep = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisa de CEP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => setState(() {
                this._cep = value;
              }),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Informe o CEP desejado",
                border: InputBorder.none,
              ),
            ),
            ViaCepContainer(
              cep: this._cep,
            ),
          ],
        ),
      ),
    );
  }
}
