import 'package:benesse_app/model/question.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final int num;

  const ResultPage({Key key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("正負の数1"),
        ),
        body: Builder(
          builder: (BuildContext context) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(

                    child: Center(child: Text("10点中$num点",
                      style: TextStyle(
                        fontSize: 30
                      ),),),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                ),
                  HorizontalLine(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(14.4),
                          border: Border.all(
                              color: Colors.blueGrey,
                              style: BorderStyle.solid
                          )
                      ),
                      height: 120,
                      child: Center(child: Text("よくできました！")),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text("戻る"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
          )),
        ),
    );
  }
}
