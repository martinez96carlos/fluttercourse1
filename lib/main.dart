import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 12},
        {'text': 'Red', 'score': 9},
        {'text': 'Green', 'score': 6},
        {'text': 'Green', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Snake', 'score': 6},
        {'text': 'Lion', 'score': 4},
        {'text': 'Zebra', 'score': 2},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor',
      'answers': [
        {'text': 'Carlos', 'score': 4},
        {'text': 'Lulu', 'score': 3},
        {'text': 'Vivi', 'score': 2},
        {'text': 'Andres', 'score': 1},
        ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;  
    });
    
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
