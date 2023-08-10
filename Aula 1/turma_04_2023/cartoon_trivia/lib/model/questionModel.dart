import 'dart:math';

import 'package:cartoon_trivia/model/cartoonModel.dart';

enum QuestionModelType { qmtCreator, qmtYearOfCreation, qmEpisodeCount }

class QuestionModel {
  late CartonModel cartoon;
  late QuestionModelType type;
  List<String> options = [];
  int correctAnswer = 0;

  QuestionModelType _randomizeType() {
    Random vrRandom = Random();

    switch(vrRandom.nextInt(3)) {
      case 0: QuestionModelType.qmtCreator;
              break;
      case 1: QuestionModelType.qmtYearOfCreation;
              break;

      case 2: QuestionModelType.qmEpisodeCount;
              break;
    }

    return QuestionModelType.qmtCreator;
  }

  QuestionModel(CartonModel prModel) {
    this.cartoon = prModel;

    this.type = this._randomizeType();

    this._GenerateAnswers();
  }

  String get questionText {
    String vrQuestion = "";

    switch (this.type) {
      case QuestionModelType.qmtCreator: vrQuestion = "Who creates the cartoon ${this.cartoon.title}?";
                                         break;

      case QuestionModelType.qmtYearOfCreation: vrQuestion = "When the cartoon ${this.cartoon.title} was created?";
                                                break;

      case QuestionModelType.qmEpisodeCount: vrQuestion = "How many episodes ${this.cartoon.title} has?";
                                             break;
    }

    return vrQuestion;
  }

  void _GenerateAnswers() {
    Random vrRandom = Random();

    this.correctAnswer = vrRandom.nextInt(4);

    switch (this.type) {
      case QuestionModelType.qmtCreator: this.options[this.correctAnswer] = this.cartoon.creators[0];
      break;

      case QuestionModelType.qmtYearOfCreation: this.options[this.correctAnswer] = this.cartoon.year.toString();
      break;

      case QuestionModelType.qmEpisodeCount: this.options[this.correctAnswer] = this.cartoon.episodes.toString();
      break;
    }

    for (int i = 0; i < 4; i++) {
      if (i == this.correctAnswer)
        continue;

      this.options[i] = this._generateQuestion();
    }
  }

  String _generateQuestion() {
    switch (this.type) {
      case QuestionModelType.qmtCreator: Random vrRandom = Random();
                                         return this._nameList()[vrRandom.nextInt(this._nameList().length)];
      break;

      case QuestionModelType.qmtYearOfCreation: Random vrRandom = Random();
                                                return (vrRandom.nextInt(120) + 1900).toString();
      break;

      case QuestionModelType.qmEpisodeCount: Random vrRandom = Random();
                                             return vrRandom.nextInt(800).toString();
      break;
    }

    return "";
  }

  List<String> _nameList() {
    return [
      "José",
      "João",
      "Tobias",
      "Marky Mark",
      "Elton John",
      "Sidney Sheldon",
      "Peter Sellers",
      "Silvio Santos",
      "Galerito",
      "Gil da Esfiha"
    ];
  }
}
