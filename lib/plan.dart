import 'package:flutter/material.dart';

class WeekPlanPage extends StatefulWidget {
  @override
  _WeekPlanPageState createState() => _WeekPlanPageState();
}

class DayOfWeek {
  const DayOfWeek({this.month, this.day, this.dayOfWeek, this.numberOfWeek});

  final int month;
  final int day;
  final String dayOfWeek;
  final int numberOfWeek;
}

class _WeekPlanPageState extends State<WeekPlanPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static DateTime _now = DateTime.now();
  static DateTime _thisWeekMonday =
      _now.subtract(new Duration(days: _now.weekday - 1));
  var _weekName = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var timeList = [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];

  final List<DayOfWeek> weekData = [
    DayOfWeek(
        month: _thisWeekMonday.month,
        day: _thisWeekMonday.day,
        dayOfWeek: '月',
        numberOfWeek: 1),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 1)).month,
        day: _thisWeekMonday.add(new Duration(days: 1)).day,
        dayOfWeek: '火',
        numberOfWeek: 2),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 2)).month,
        day: _thisWeekMonday.add(new Duration(days: 2)).day,
        dayOfWeek: '水',
        numberOfWeek: 3),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 3)).month,
        day: _thisWeekMonday.add(new Duration(days: 3)).day,
        dayOfWeek: '木',
        numberOfWeek: 4),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 4)).month,
        day: _thisWeekMonday.add(new Duration(days: 4)).day,
        dayOfWeek: '金',
        numberOfWeek: 5),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 5)).month,
        day: _thisWeekMonday.add(new Duration(days: 5)).day,
        dayOfWeek: '土',
        numberOfWeek: 6),
    DayOfWeek(
        month: _thisWeekMonday.add(new Duration(days: 6)).month,
        day: _thisWeekMonday.add(new Duration(days: 6)).day,
        dayOfWeek: '日',
        numberOfWeek: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('予定入力'),
          bottom: new TabBar(
              controller: _tabController,
              tabs: weekData
                  .map((w) => Tab(text: "${w.dayOfWeek}"))
                  .toList())),
      body: TabBarView(
          controller: _tabController,
          children: weekData.map((w) => DayPlan(w.dayOfWeek)).toList()),
    );
  }
}

Widget DayPlan(dayOfWeek) {
  List<bool> selectedBool = List.generate(31, (i) => false);

//  final items = List<int>.generate(28, (i) => i);
//  final times = items
//      .asMap().forEach((item, index) => {
//            Text('${index + 7}:${(index.isOdd) ? '30' : '00'}',
//                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
//      });



  return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        if (i < 31) {
          return ListTile(
            title: Text('${(7+(i-i%2)/2).round()}:${i.isOdd ? '30' : '00'}', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
            selected: selectedBool[i],
            onTap: () {
              selectedBool[i] = selectedBool[i] ? false : true;
            },
          );
        }
      });
}