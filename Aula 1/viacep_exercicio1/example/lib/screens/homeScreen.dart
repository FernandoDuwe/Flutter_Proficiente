import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viacep_exercicio1/widgets/viaCepDetails.dart';
import 'package:viacep_exercicio1/widgets/viaCepInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _cep = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisa de CEP™"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  this._cep = value;
                });
              },
              decoration: InputDecoration(
                labelText: "CEP",
              ),
            ),
          ),
          ViaCepDetails(
            cep: this._cep,
            onError: (prErrorMessage) => Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  prErrorMessage,
                  style: TextStyle(color: Colors.red),
                )),
            onLoading: () => CircularProgressIndicator(),
            onSuccess: (prCEP) => ViaCepInfo(cepModel: prCEP),
          )
        ],
      ),
    );
  }
}
