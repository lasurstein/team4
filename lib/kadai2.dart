import 'package:flutter/material.dart';
import 'package:team4/timetable2.dart';
import 'package:team4/util/hexcolor.dart';
import 'plan.dart';

void main() => runApp(new MaterialApp(
      home: HomeWork(),
    ));
//void main() => runApp(new MaterialApp(
//      home: HomeWork(),
//    ));

class HomeWork extends StatelessWidget {
  HomeWork({this.planTimes});

  final List<List<bool>> planTimes; //予定入力画面で予定ありとして選択した枠がtrueになっている

  final List<HomeWorkDetail> homeWorkList = HomeWorkDetail.getHomeWorkDetail();

  static int _japanese = 0;
  static int _math = 0;
  static int _english = 0;
  static int _socialStudies = 0;
  static int _science = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("今週強化する科目")),
      ),
      body: ListView.builder(
          itemCount: homeWorkList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              homeWorkCheck(homeWorkList[index], context),
            ]);
          }),
    );
  }

  Widget homeWorkCheck(HomeWorkDetail homeworkdetail, BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MyHomePage(sub: homeworkdetail.subject, occ: planTimes);
          }),
        )
      },
//      child: Padding(
//        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height) / 5,
        //margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: HexColor(homeworkdetail.color).withOpacity(0.5),
//              borderRadius: BorderRadius.circular(7.0)
        ),
        child: Center(
          child: Text(
            homeworkdetail.subject,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
        ),
      ),
//      ),
    );
  }

//  void _navigateToNext(BuildContext context, String sub, List<List<bool>> occ) {
//    Navigator.push(
//        context,
//        new MaterialPageRoute(
//            builder: (context) => new MyHomePage(sub: sub, occ: occ)));
//  }
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
