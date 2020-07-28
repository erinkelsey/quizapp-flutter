import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

/// Main app file that contains the logic for running
/// the quiz app
class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  /// Static questions and answer choices for the quiz
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Leopard', 'score': 6},
        {'text': 'Koala Bear', 'score': 11},
        {'text': 'Fennec Fox', 'score': 3},
        {'text': 'Sloth', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': [
        {'text': 'Burgers', 'score': 1},
        {'text': 'Tacos', 'score': 1},
        {'text': 'Noodles', 'score': 1},
        {'text': 'Pizza', 'score': 1},
      ],
    },
  ];

  /// The index in [_questions] that the quiz is
  /// currently on
  var _questionIndex = 0;

  /// The total number of points that a user has
  /// accumulated throughout the quiz.
  ///
  /// Lower scores are better than higher scores
  var _totalScore = 0;

  /// Resets the quiz to it's initial state.
  ///
  /// Quiz goes back to first question ([_questionsIndex] is
  /// set back to 0). Total score [_totalScore] is reset back
  /// to 0.
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  /// Processes the user's answer to a question.
  ///
  /// Adds the [score] to the the user's running total score. The
  /// score is statically assigned to answers of questions.
  /// Increasing [_questionIndex] by 1, so that the next question
  /// is shown to the user.
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  /// Main build method for quiz.
  ///
  /// If [_questionIndex] is less than the length of questions,
  /// builds the quiz screen for the user based on which question
  /// that they are currently on.
  ///
  /// Else, quiz is completed, and need to show the results of quiz.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
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
