import 'package:flutter/material.dart';
import 'package:viacep_proway/src/repositories/viacepRepository.dart';

class CepDetail extends StatelessWidget {
  final String cep;

  const CepDetail({required this.cep, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cep.isEmpty)
      return Text("Nenhum CEP Informado");

    ViacepRepository viacepRepository = ViacepRepository();

    return FutureBuilder(
      future: viacepRepository.retornaCEP(cep),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text(
              "Erro ao buscar o CEP: ${snapshot.error.toString()}",
              style: TextStyle(color: Colors.red),
            ),
          );

        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (snapshot.data == null)
          return Center(
            child: Text("O CEP informado é inválido"),
          );

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CEP: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(snapshot.data!.cep),
            SizedBox(height: 10,),
            Text("Logradouro: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(snapshot.data!.logradouro),
            SizedBox(height: 10,),
            Text("Complemento: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(snapshot.data!.complemento),
            SizedBox(height: 10,),
            Text("Bairro: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(snapshot.data!.bairro),
            SizedBox(height: 10,),
            Text("Cidade: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${snapshot.data!.localidade}/${snapshot.data!.uf}"),
            SizedBox(height: 10,),
          ],
        );
      },
    );
  }
}
