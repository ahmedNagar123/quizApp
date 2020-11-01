import 'package:flutter/material.dart';

import '../main.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen(this.score);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: TextStyle(fontSize: 29),
              ),
              Text(
                'From 10',
                style: TextStyle(fontSize: 29),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyApp();
                    }));
                  },
                  child: Text(
                    'Replay',
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
