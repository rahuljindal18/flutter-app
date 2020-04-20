import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;
  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = "Great";
    } else if (totalScore <= 12) {
      resultText = "Nice";
    } else if (totalScore <= 16) {
      resultText = "OKK";
    } else {
      resultText = "Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text("Reset Quiz"),
          textColor: Colors.red,
          onPressed: resetQuiz,
        ),
      ]),
    );
  }
}
