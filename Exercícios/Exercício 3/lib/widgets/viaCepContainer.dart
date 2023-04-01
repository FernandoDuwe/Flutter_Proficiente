import 'package:flutter/material.dart';
import 'package:test_package/repository/ViaCEPRepository.dart';
import 'package:test_package/widgets/cepInfoContainer.dart';

class ViaCepContainer extends StatelessWidget {
  final String cep;

  const ViaCepContainer({required this.cep, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ViaCEPRepository.get(cep),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(snapshot.error.toString(), style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return CircularProgressIndicator();

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CEPInfoContainer(title: "CEP", info: snapshot.data!.CEP),
              CEPInfoContainer(title: "Bairro", info: snapshot.data!.Bairro),
              CEPInfoContainer(title: "Complemento", info: snapshot.data!.Complemento),
              CEPInfoContainer(title: "DDD", info: snapshot.data!.DDD),
              CEPInfoContainer(title: "Gia", info: snapshot.data!.Gia),
              CEPInfoContainer(title: "IBGE", info: snapshot.data!.IBGE),
              CEPInfoContainer(title: "Localidade", info: snapshot.data!.Localidade),
              CEPInfoContainer(title: "Logradouro", info: snapshot.data!.Logradouro),
              CEPInfoContainer(title: "Siafi", info: snapshot.data!.Siafi),
            ],
          );
        });
  }
}
