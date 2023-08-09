import 'package:flutter/material.dart';
import 'package:viacep_proway/viacep_proway.dart';

class HomeCep extends StatefulWidget {
  const HomeCep({Key? key}) : super(key: key);

  @override
  State<HomeCep> createState() => _HomeCepState();
}

class _HomeCepState extends State<HomeCep> {
  String cep = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            setState(() {
              cep = "89066377";
            });
          }, icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CepDetail(cep: this.cep),
      ),
    );
  }
}
