import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/module/question.dart';
import 'package:quiz_app/repo/data.dart';
import 'package:quiz_app/screens/result.dart';

class QuizBrain with ChangeNotifier {
  int _questionNumber = 0;
  List answer = [];
  int score = 0;
  List<Question> _questionBank = [
    Question('what is the capital of qatar', 'doha'),
    Question('What are the smallest Arab countries in area?', 'bahrain'),
    Question('What Is The Capital Of Egypt', 'cairo'),
    Question('What is the capital of France.', 'paris'),
    Question('what is the capital of England', 'london'),
  ];

  getRandomQuestion() {
    _questionBank.shuffle();
    notifyListeners();
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else
      return false;
  }

  reset() {
    _questionNumber = 0;
  }

  int getNumberRandom() {
    int number = 0;
    number = Random().nextInt(3);
    return number;
  }

  getRandomAnswer() {
    if (answer.isNotEmpty) {
      answer.clear();
    }
    for (int i = 0; i <= 2; i++) {
      int number = 0;
      number = Random().nextInt(getDataFalse().length);
      answer.add(getDataFalse()[number]);
    }
    answer.insert(getNumberRandom(), getCorrectAnswer());
  }

  checkAnswer(int index, BuildContext context) {
    if (answer[index] == getCorrectAnswer()) {
      score += 2;
      if (isFinished()) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ResultScreen(score);
        }));
        return;
      }
      nextAnswerAndQues();
    } else {
      if (isFinished()) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ResultScreen(score);
        }));
        return;
      }
      nextAnswerAndQues();
      return;
    }
  }

  nextAnswerAndQues() {
    nextQuestion();
    answer.clear();
    getRandomAnswer();
    notifyListeners();
  }

  List<String> getDataFalse() {
    return Data().dataFalse;
  }
}
