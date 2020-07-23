import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
      {
        'questionText' : 'What is your favorite color?', 
        'answers' : [
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 6}, 
          {'text': 'Green', 'score': 3}, 
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText' : 'What is your favorite animal?', 
        'answers' : [
          {'text': 'Leopard', 'score': 6}, 
          {'text': 'Koala Bear', 'score': 11}, 
          {'text': 'Fennec Fox', 'score': 3}, 
          {'text': 'Sloth', 'score': 1},
        ],
      },
      {
        'questionText' : 'What is your favorite food?', 
        'answers' : [
          {'text': 'Burgers', 'score': 1}, 
          {'text': 'Tacos', 'score': 1}, 
          {'text': 'Noodles', 'score': 1}, 
          {'text': 'Pizza', 'score': 1},
        ],
      },
    ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    // print(Platform.isIOS);
    // print(kIsWeb);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      body: _questionIndex < _questions.length 
          ? Quiz(
              answerQuestion: _answerQuestion, 
              questionIndex: _questionIndex, 
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ),
    );
  }
  
}