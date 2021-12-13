import 'package:flutter/material.dart';
import 'package:my_first_app/answer.dart';
import 'package:my_first_app/result.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Green', 'score': 7},
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 3},
        {'text': 'Yellow', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 6},
        {'text': 'Lion', 'score': 5},
        {'text': 'Birds', 'score': 9},
        {'text': 'Jaguar', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favourite pass time activity?',
      'answers': [
        {'text': 'Reading', 'score': 10},
        {'text': 'Sleeping', 'score': 5},
        {'text': 'Netflixing', 'score': 5},
        {'text': 'Music (playing or singing)', 'score': 7},
      ],
    },
    {
      'questionText': 'Which would you prefer?',
      'answers': [
        {'text': 'Travel the world', 'score': 8},
        {'text': 'Wealthy, but restricted to a country', 'score': 3},
        {'text': 'Own a multibillion dollars business', 'score': 8},
        {'text': 'King  Solomon\'s wisdom', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
          ),
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
