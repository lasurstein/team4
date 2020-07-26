import 'package:flutter/material.dart';

class TestQuizApp extends StatefulWidget {
  @override
  _TestQuizAppState createState() => _TestQuizAppState();
}

class _TestQuizAppState extends State<TestQuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("Gitはバージョン管理システムである.", true),
    Question.name("Fluttarはプログラミング言語の一種である.", false),
    Question.name("dartはJavaScriptの代替となることを目的としてつくられた.", true),
    Question.name("問題は以上です!\n恐竜の様子を見てみましょう!", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Test"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 16.9,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade100,
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade100,
                    child: Text("TRUE"),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade100,
                    child: Text("FALSE"),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade100,
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    setState(() {
      if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
        final snackbar = SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
            content: Text("正解!"));
        Scaffold.of(context).showSnackBar(snackbar);
        _nextQuestion();
      } else {
        final snackbar = SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1),
            content: Text("不正解!"));
        Scaffold.of(context).showSnackBar(snackbar);
        _nextQuestion();
      }
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    setState(() {
        _currentQuestionIndex =
            (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}

class Question{
  String questionText;
  bool isCorrect;
  Question.name(this.questionText,this.isCorrect);
}