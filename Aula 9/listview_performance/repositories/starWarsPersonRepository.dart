import 'dart:convert';

import 'package:listview_performance/models/starWarsPersonModel.dart';
import "package:http/http.dart" as http;

class StarWarsPersonRepository {
  static Future<List<StarWarsPersonModel>> getPerson(int page) async {
    Uri uri = Uri.https("swapi.dev", "/api/people", {"page": page.toString()});

    var resposta = await http.get(uri);

    var jsonResposta = jsonDecode(resposta.body);

    List<StarWarsPersonModel> list = [];

    (jsonResposta["results"] as List<dynamic>).forEach((element) {
      list.add(StarWarsPersonModel.fromJson(element as Map<String, dynamic>));
    });

    return list;
  }
}
