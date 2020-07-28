import 'package:flutter/material.dart';

/// Widget for building the quiz result.
///
/// Returns the result of the quiz as text. The result
/// text returned is based on the user's total quiz score [resultScore].
/// Higher score is worse than a lower score. Predefined
/// score totals determine which result you get back. Also
/// includes a button to reset the quiz, and assigns [resetHandler]
/// to it.
///
/// > default: 'You did it!'
/// > <= 8 points: 'You are awesome!'
/// > <= 12 points: 'Pretty likeable!'
/// > <= 16 points: 'You are .. strange?'
/// > \> 16 points: 'You are unlikeable'
class Result extends StatelessWidget {
  /// The user's total quiz score.
  final int resultScore;

  /// The function to call if user wants to reset the quiz.
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  /// Returns the result of the quiz as a string, based
  /// on the users total score.
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are unlikeable!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          OutlineButton(
              child: Text('Restart Quiz'),
              onPressed: resetHandler,
              borderSide: BorderSide(
                  color: Colors.blue, width: 1.0, style: BorderStyle.solid),
              textColor: Colors.blue),
        ],
      ),
    );
  }
}
