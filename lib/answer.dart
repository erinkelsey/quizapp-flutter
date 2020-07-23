import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
      // width: double.infinity,
      // margin: EdgeInsets.all(50),
      child: OutlineButton(
          child: Text(answerText), 
          onPressed: selectHandler,
          borderSide: BorderSide(color: Colors.blue),
          textColor: Colors.blue,
          // highlightedBorderColor: Colors.blue
        ),
    );
  }
}