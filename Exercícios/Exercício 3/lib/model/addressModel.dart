class AddressModel {
  String CEP = "";
  String Logradouro = "";
  String Complemento = "";
  String Bairro = "";
  String Localidade = "";
  String UF = "";
  String IBGE = "";
  String Gia = "";
  String DDD = "";
  String Siafi = "";

  AddressModel.fromJSON(Map<String, dynamic> prJSON) {
    if ((prJSON["erro"] != null) && (prJSON["erro"]))
      throw Exception("O CEP informado é inválido ou não foi encontrado");

    this.CEP = prJSON["cep"];
    this.Logradouro = prJSON["logradouro"];
    this.Complemento = prJSON["complemento"];
    this.Bairro = prJSON["bairro"];
    this.Localidade = prJSON["localidade"];
    this.UF = prJSON["uf"];
    this.IBGE = prJSON["ibge"];
    this.Gia = prJSON["gia"];
    this.DDD = prJSON["ddd"];
    this.Siafi = prJSON["siafi"];
  }
}
