import 'package:flutter/material.dart';

/// Widget for building a quiz question.
///
/// Returns the [questionText] as a Text
/// widget in a container.
class Question extends StatelessWidget {
  /// The text of a quiz questions.
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double
            .infinity, // container take full width of screen (as much width as it can get)
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
