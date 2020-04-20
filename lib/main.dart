import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionsText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Red', 'score': 1},
      ]
    },
    {
      'questionsText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cow', 'score': 1},
        {'text': 'Dog', 'score': 5},
        {'text': 'Lion', 'score': 3},
        {'text': 'Rabbit', 'score': 10},
      ]
    },
    {
      'questionsText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Kyle', 'score': 5},
        {'text': 'Will', 'score': 3},
        {'text': 'Brian', 'score': 10},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
