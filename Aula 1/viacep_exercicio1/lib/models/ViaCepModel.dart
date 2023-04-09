class ViaCepModel {
  String cep = "";
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ibge = "";
  String gia = "";
  String ddd = "";
  String siafi = "";

  ViaCepModel.fromJSON(Map<String, dynamic> prJSON) {
    cep = prJSON["cep"];
    logradouro = prJSON["logradouro"];
    complemento = prJSON["complemento"];
    bairro = prJSON["bairro"];
    localidade = prJSON["localidade"];
    uf = prJSON["uf"];
    ibge = prJSON["ibge"];
    gia = prJSON["gia"];
    ddd = prJSON["ddd"];
    siafi = prJSON["siafi"];
  }

  @override
  String toString() {
    return "Dados do cep ${cep}: ${uf} - ${localidade} - ${bairro} - ${logradouro}";
  }
}