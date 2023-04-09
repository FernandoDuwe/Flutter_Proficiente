import 'package:flutter/material.dart';

typedef QuestionOptionTileOnAnswer = void Function(int index);

class QuestionOptionTile extends StatelessWidget {
  final int id;
  final String text;
  final bool canAnswer;
  final bool isCorrect;
  final QuestionOptionTileOnAnswer onAnswer;

  const QuestionOptionTile(
      {required this.id, required this.text, required this.canAnswer, required this.isCorrect, required this.onAnswer, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.canAnswer)
      return ListTile(
        title: Text(this.text),
        onTap: () => this.onAnswer(this.id),
      );

    return Container(
      child: Text(this.text),
      color: (this.isCorrect ? Colors.green : Colors.red),
    );
  }
}
