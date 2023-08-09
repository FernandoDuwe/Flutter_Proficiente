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

  ViaCepModel.fromJSON(Map<String, dynamic> json) {
    this.cep = json["cep"];
    this.logradouro = json["logradouro"];
    this.complemento = json["complemento"];
    this.bairro = json["bairro"];
    this.localidade = json["localidade"];
    this.uf = json["uf"];
    this.ibge = json["ibge"];
    this.gia = json["gia"];
    this.ddd = json["ddd"];
    this.siafi = json["siafi"];
  }
}