import 'dart:convert';

import '../models/viacepModel.dart';
import 'package:http/http.dart' as http;

class ViacepRepository {
  Future<ViaCepModel?> retornaCEP(String numeroCEP) async {
    numeroCEP = numeroCEP.replaceAll("-", "");
    numeroCEP = numeroCEP.replaceAll(" ", "");

    if (numeroCEP.isEmpty)
      return null;

    if (numeroCEP.length != 8)
      return null;

    Uri vrURI = Uri.https("viacep.com.br", "/ws/${numeroCEP}/json/");

    http.Response resposta = await http.get(vrURI);

    var vrJson = jsonDecode(resposta.body);

    return ViaCepModel.fromJSON(vrJson);
  }
}