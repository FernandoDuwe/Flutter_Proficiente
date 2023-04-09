import 'package:flutter/material.dart';
import 'package:viacep_exercicio1/models/ViaCepModel.dart';

class ViaCepInfo extends StatelessWidget {
  final ViaCepModel cepModel;

  const ViaCepInfo({required this.cepModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cepModel.cep),
        Text(cepModel.localidade),
        Text(cepModel.logradouro),
        Text(cepModel.bairro),
        Text(cepModel.uf),
        Text(cepModel.siafi),
        Text(cepModel.ibge),
        Text(cepModel.complemento),
      ],
    );
  }
}
