import 'dart:convert';

import 'package:cartoon_trivia/model/cartoonModel.dart';
import 'package:http/http.dart' as http;

class CartoonRepository {
  Future<List<CartonModel>> get2D() async {
    return await this.get("cartoons2D");
  }

  Future<List<CartonModel>> get3d() async {
    return await this.get("cartoons3D");
  }

  Future<List<CartonModel>> get(String prType) async {
    Uri vrURI = Uri.https("api.sampleapis.com", "/cartoons/${prType}");

    http.Response vrResponse = await http.get(vrURI);
    List vrData = json.decode(vrResponse.body);

    List<CartonModel> vrModels = [];

    vrData.forEach((element) {
      vrModels.add(CartonModel.fromJSON(element));
    });

    return vrModels;
  }

  Future<CartonModel?> getById(String prType, int prID) async {
    List<CartonModel> vrList = await this.get(prType);

    for(int i = 0; i < vrList.length; i++)
      if (vrList[i].id == prID)
        return vrList[i];

    return null;
  }
}