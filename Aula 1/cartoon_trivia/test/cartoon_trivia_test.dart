import 'package:cartoon_trivia/repositories/cartoonRepository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Basic Test", () async {
    CartoonRepository vrRepository = CartoonRepository();

    await vrRepository.get2D();
  });
}
