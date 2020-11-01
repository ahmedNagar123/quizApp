import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'file:///D:/projectFlutter/quiz_app/lib/provider/quiz_brain.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<QuizBrain>(context, listen: false).getRandomQuestion();
      Provider.of<QuizBrain>(context, listen: false).getRandomAnswer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuizBrain>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  data.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: data.answer.length,
              itemBuilder: (ctx, index) {
                return FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    data.checkAnswer(index, context);
                  },
                  child: Text(
                    data.answer[index],
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                );
              },
            ),
          )),
        ]);
  }
}
