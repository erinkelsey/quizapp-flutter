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
        'answers' : ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText' : 'What is your favorite animal?', 
        'answers' : ['Leopard', 'Koala Bear', 'Fennec Fox', 'Sloth']
      },
      {
        'questionText' : 'What is your favorite food?', 
        'answers' : ['Burgers', 'Tacos', 'Noodles', 'Pizza']
      },
    ];

  int _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
        _questionIndex = _questionIndex + 1;
        print(_questionIndex);
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
          : Result(),
    ),
    );
  }
  
}