import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function()? resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'You did it!';
    } else if (resultScore <= 20) {
      resultText = 'Good job, You did it!';
    } else if (resultScore <= 30) {
      resultText = 'Great job, You are smart!';
    } else {
      resultText = 'You are super awesome, and smart!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            //textColor: Colors.redAccent,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
