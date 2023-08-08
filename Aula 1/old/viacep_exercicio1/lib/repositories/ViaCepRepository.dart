import 'dart:convert';

import '../models/ViaCepModel.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  static Future<ViaCepModel> getFromCEP(String prCEP) async {
    prCEP = prCEP.replaceAll("-", "").trim();

    if (prCEP.length != 8)
      throw Exception("O CEP informado (${prCEP}) é inválido.");

    Uri vrURI = Uri.https("viacep.com.br", "/ws/${prCEP}/json/");

    http.Response vrResponse = await http.get(vrURI);

    if (vrResponse.statusCode != 200)
      throw Exception("Erro ao buscar os dados de CEP: HTTP error ${vrResponse.statusCode}");

    return ViaCepModel.fromJSON(json.decode(vrResponse.body));
  }
}