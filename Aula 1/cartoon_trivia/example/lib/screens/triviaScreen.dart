import 'package:cartoon_trivia/model/questionModel.dart';
import 'package:cartoon_trivia/repositories/triviaRepository.dart';
import 'package:flutter/material.dart';
import 'package:cartoon_trivia_example/widgets/questionOptionTile.dart';

class TriviaScreen extends StatefulWidget {
  final QuestionModel question;

  const TriviaScreen({required this.question, Key? key}) : super(key: key);

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int currentAnswer = -1;

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
      body: ListView.builder(
          itemCount: this.widget.question.options.length + 2,
          itemBuilder: (context, index) {
           if (index == 0)
             return Container(
               height: 200,
               width: double.infinity,
               child: Image(
                 image: NetworkImage(this.widget.question.cartoon.image),
                 height: double.infinity,
                 width: double.infinity,
                 fit: BoxFit.cover,
               ),
             );

           if (index == 1)
             return Container(
            alignment: Alignment.center,
            child: Text(this.widget.question.questionText),
            );

           return QuestionOptionTile(
             id: index - 2,
             text: this.widget.question.options[index - 2],
             canAnswer: this.currentAnswer == -1,
             isCorrect: this.currentAnswer == index -2,
             onAnswer: (index) {
               setState(() {
                 this.currentAnswer = index;
               });
             },
           );
          }),
    );
  }
}
