import 'package:flutter_test/flutter_test.dart';
import 'package:viacep_exercicio1/models/ViaCepModel.dart';
import 'package:viacep_exercicio1/repositories/ViaCepRepository.dart';

void main() {
  test("Teste de conexão", () async {
    ViaCepModel vrEndereco = await ViaCepRepository.getFromCEP("89041390");

    print(vrEndereco);

    expect(vrEndereco.localidade, "Blumenau");
  });
}
