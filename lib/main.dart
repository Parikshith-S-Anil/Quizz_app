import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizyy/question.dart';
import 'package:quizyy/quizbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizbank = QuizBank();

void main() {
  runApp(Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
   List<Icon> ScoreKeeper = [];

   void checkAnswer(bool userSelectedAnswer){
     bool CorrectAnswer = quizbank.getQuestionAnswer();
     setState(() {

       if(quizbank.isFinished() == true){
         Alert(
           context: context,
           title: 'Finished',
           desc: 'you are completed the quiz successfully',
         ).show();

         quizbank.reset();
         ScoreKeeper = [];
       }
       else{
         if (userSelectedAnswer == CorrectAnswer) {
           ScoreKeeper.add(Icon(Icons.done,color: Colors.green),);
         } else {
           ScoreKeeper.add(Icon(Icons.close,color: Colors.red),);
         }
         quizbank.nextQuestion();
       }

     });
   }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizbank.getQuestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        ),
      ],
    );
  }
}
