import 'dart:convert';

import 'package:test_package/model/addressModel.dart';
import 'package:http/http.dart' as http;

class ViaCEPRepository {
  static Future<AddressModel> get(String prCEP) async {
    prCEP = prCEP.trim().replaceAll("-", "");

    if (prCEP.isEmpty)
      throw Exception("O CEP informado está em branco!");

    if (prCEP.length != 8)
      throw Exception("O CEP informado não está completo!");

    Uri vrURL = Uri.https("viacep.com.br", "/ws/$prCEP/json/");

    http.Response vrResponse = await http.get(vrURL);

    return AddressModel.fromJSON(json.decode(vrResponse.body));
  }
}
