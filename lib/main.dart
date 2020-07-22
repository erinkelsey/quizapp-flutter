import 'package:flutter/material.dart';

import './question.dart';

// void main() {
//   runApp(QuizApp());
// }

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What is your favorite color?',
      'What is your favorite animal?',
    ];

    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      body: Column(children: [
        Question(
          questions.elementAt(_questionIndex),
        ),
        RaisedButton(
          child: Text('Answer 1'), 
          onPressed: _answerQuestion,
        ),
        RaisedButton(
          child: Text('Answer 2'), 
          onPressed: _answerQuestion,
        ),
        RaisedButton(
          child: Text('Answer 3'), 
          onPressed: _answerQuestion,
        ),
      ],),

    ),);
  }
  
}