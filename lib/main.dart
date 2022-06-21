import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'whats your favourite color ?',
      'answers': ['yellow', 'red', 'green', 'blue']
    },
    {
      'questionText': 'whats your favourite animal ?',
      'answers': ['cat', 'dog', 'rabbit', 'monkey']
    },
    {
      'questionText': 'whats your favourite game ?',
      'answers': ['cricket', 'footbal', 'wretsling', 'killing']
    },
    {
      'questionText': 'whats your favourite hobby ?',
      'answers': ['eat', 'sleep', 'repeat', 'code']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex >= 4) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Questions')),
        backgroundColor: Color.fromARGB(255, 255, 204, 19),
      ),
      body: Column(children: [
        Question(_questions[_questionIndex]['questionText']),
        ...(_questions[_questionIndex]['answers'] as List<String>)
            .map((answer) => Answer(_answerQuestion, answer))
      ]),
      backgroundColor: Color.fromARGB(255, 255, 233, 168),
    ));
  }
}
