import 'package:flutter/material.dart';
import 'package:viacep_exercicio1/models/ViaCepModel.dart';
import 'package:viacep_exercicio1/repositories/ViaCepRepository.dart';

typedef ViaCepDetailsOnLoading = Widget Function();
typedef ViaCepDetailsOnError = Widget Function(String prErrorMessage);
typedef ViaCepDetailsOnSuccess = Widget Function(ViaCepModel prCEP);

class ViaCepDetails extends StatelessWidget {
  final String cep;
  final ViaCepDetailsOnError? onError;
  final ViaCepDetailsOnLoading? onLoading;
  final ViaCepDetailsOnSuccess onSuccess;

  const ViaCepDetails({required this.cep, required this.onSuccess, this.onLoading, this.onError, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ViaCepRepository.getFromCEP(cep),
        builder: (context, snapshot) {
          if ((snapshot.hasError) && (onError != null))
            return onError!(snapshot.error.toString());

          if ((!snapshot.hasData) && (onLoading != null))
            return onLoading!();

          if ((snapshot.hasData) && (onSuccess != null))
            return onSuccess(snapshot.data!);

          return Container();
        });
  }
}
