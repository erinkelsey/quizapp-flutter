import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

/// Widget for building the quiz.
///
/// Returns the current quiz question pointed to in the
/// [questions] list by the [questionIndex] as a widget
/// with the question displayed at the top, and the button
/// question answers below. Passes through the [answerQuestion]
/// function (with a specific answer score) to the Answer widget.
class Quiz extends StatelessWidget {
  /// List of mapped string, object items as questions for this quiz.
  final List<Map<String, Object>> questions;

  /// The current index for this quiz.
  final int questionIndex;

  /// The function to pass to each answer of the current quiz question.
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
