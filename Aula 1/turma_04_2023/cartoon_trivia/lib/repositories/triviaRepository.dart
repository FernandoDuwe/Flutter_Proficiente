import 'dart:math';

import 'package:cartoon_trivia/model/cartoonModel.dart';
import 'package:cartoon_trivia/repositories/cartoonRepository.dart';

import '../model/questionModel.dart';

class TriviaRepository {
  static Future<QuestionModel> nextQuestion() async {
    CartoonRepository vrRepository = CartoonRepository();

    List<CartonModel> vrCartoons = await vrRepository.get("cartoon3d");

    Random vrRandom = Random();

    return QuestionModel(vrCartoons[vrRandom.nextInt(vrCartoons.length)]);
  }
}