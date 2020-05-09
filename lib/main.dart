import 'package:flutter/material.dart';
import 'package:quizzapp/screen/result.dart';
import 'package:quizzapp/screen/start.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'screen/quiz.dart';

Quiz quiz = Quiz();

void main() => runApp(Quizz());
class Quizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        'start': (context) => Start(),
        'quiz': (context) =>Quiz(),
        'result': (context) => Result(marks: null,),
      },
      home: Start(),
    );
  }
}
