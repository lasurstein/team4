import 'package:flutter/material.dart';
import 'package:team4/util/hexcolor.dart';

void main() => runApp(new MaterialApp(
      home: HomeWork(),
    ));

class HomeWork extends StatefulWidget {
  @override
  _HomeWorkState createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  final List<HomeWorkDetail> homeWorkList = HomeWorkDetail.getHomeWorkDetail();
  List subject = ["国語", "数学", "英語", "社会", "理科"];

  static int _japanese = 0;
  static int _math = 0;
  static int _english = 0;
  static int _socialStudies = 0;
  static int _science = 0;

  List<int> koma = [_japanese, _math, _english, _socialStudies, _science];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("強化したい科目")),
      ),
      body: ListView.builder(
          itemCount: subject.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              homeWorkCheck(homeWorkList[index], context),
            ]);
          }),
    );
  }

  Widget homeWorkCheck(HomeWorkDetail homeworkdetail, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
      child: Container(
        color: HexColor(homeworkdetail.color).withOpacity(0.5),
        child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(homeworkdetail.subject),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            hintText: "コマ数",
                          ),
                          onChanged: (String value) {
                            try {
                              homeworkdetail.classes = int.parse(value);
                            } catch (exception) {
                              homeworkdetail.classes = 0;
                            }
                            debugPrint(
                                "${homeworkdetail.subject} ${homeworkdetail.classes}");
                            },
                        ),
                      ),
                    ),
                  ]),
            ),
      ),
    );
  }
}

class HomeWorkDetail {
  static List<HomeWorkDetail> getHomeWorkDetail() => [
        HomeWorkDetail("国語", _japanese, "#f06292"),
        HomeWorkDetail("数学", _math, "#64b5f6"),
        HomeWorkDetail("英語", _english, "#80c683"),
        HomeWorkDetail("社会", _socialStudies, "#c97b63"),
        HomeWorkDetail("理科", _science, "#fff59d"),
      ];

  String subject;
  int classes;
  String color; //HexColor

  static int _japanese = 0;
  static int _math = 0;
  static int _english = 0;
  static int _socialStudies = 0;
  static int _science = 0;

  HomeWorkDetail(this.subject, this.classes, this.color);
}
