import 'package:flutter/material.dart';

/// Widget for building a quiz answer button.
///
/// Returns the [answerText] as text on a button, with
/// [selectHandler] assigned to it.
class Answer extends StatelessWidget {
  /// The function to be called when/if a user selects
  /// this answer
  final Function selectHandler;

  /// The text to display in a button as the answer
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
      child: OutlineButton(
        child: Text(answerText),
        onPressed: selectHandler,
        borderSide: BorderSide(color: Colors.blue),
        textColor: Colors.blue,
      ),
    );
  }
}
