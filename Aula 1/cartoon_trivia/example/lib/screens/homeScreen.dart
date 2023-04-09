import 'package:cartoon_trivia/model/cartoonModel.dart';
import 'package:cartoon_trivia/model/questionModel.dart';
import 'package:cartoon_trivia/repositories/cartoonRepository.dart';
import 'package:cartoon_trivia/repositories/triviaRepository.dart';
import 'package:cartoon_trivia/widgets/cartoon_list.dart';
import 'package:cartoon_trivia_example/screens/triviaScreen.dart';
import 'package:cartoon_trivia_example/widgets/cartoonTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          QuestionModel vrQuestion = await TriviaRepository.nextQuestion();

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TriviaScreen(question: vrQuestion),));
        },
        child: Icon(Icons.question_answer_sharp),
      ),
      body: CartoonList(itemBuild: (CartonModel prModel) => CartoonTile(cartoon: prModel),
      )
    );
  }
}
