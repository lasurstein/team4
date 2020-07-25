import 'package:benesse_app/model/question.dart';
import 'package:benesse_app/ui/result.dart';
import 'package:benesse_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PositiveAndNegativeApp extends StatefulWidget {
  @override
  _PositiveAndNegativeAppState createState() => _PositiveAndNegativeAppState();
}

class _PositiveAndNegativeAppState extends State<PositiveAndNegativeApp> {
  Random random = new Random();

  int _positiveNegativeNumber = 0;
  int _getNumber = 0;
  int _currentQuestionIndex = 0;
  int _correctNumber = 0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("正負の数1"),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext context) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "images/PosNeg.png",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  HorizontalLine(),
                  Container(
                    child: Text("第${_currentQuestionIndex + 1}問"),
                  ),
                  Container(
                    child: Text("$_positiveNegativeNumber"),
                  ),
                  HorizontalLine(),
                  Column(
                      children: <Widget>[
                        Text(
                          "$_getNumber",
                          style: TextStyle(
                              color: _purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Slider(
                            min: -15,
                            max: 15,
                            activeColor: _purple,
                            inactiveColor: Colors.grey,
                            divisions: 30, //optional
                            value: _getNumber.toDouble(),
                            onChanged: (double newValue) {
                            setState(() {
                              _getNumber = newValue.round();
                            });
                            }),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _checkAnswer(_getNumber, context),
                        color: Colors.blueGrey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text("決定"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer()
                ],
              )
          ),
        )
    );
  }
  _checkAnswer(int userChoice, BuildContext context) {
    if (userChoice == _positiveNegativeNumber) {
      //correct answer
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          "正解~!",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _correctNumber = _correctNumber + 1;
    } else {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          "不正解~!",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blueAccent,
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    if (_currentQuestionIndex < 9) {
    _nextQuestion();
    } else {
      _navigateToNext(context, _correctNumber);
    }
  }
  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) ;
      _positiveNegativeNumber = random.nextInt(30) - 15;
    });
  }
  void _navigateToNext(BuildContext context, int num) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) =>
                new ResultPage(num: num)));
  }
}



