import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

// import './quiz.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final questions = const [
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

    // if (_questionIndex < questions.length - 1){
      
    // }

    // print(Platform.isIOS);
    // print(kIsWeb);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      body: _questionIndex < questions.length ? Column(children: [
        Question(
          questions[_questionIndex]['questionText'],
        ),
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(_answerQuestion, answer);
        }).toList(),
      ],
      ) : Center(child: Text('You did it!'),),
    ),
    );
  }
  
}