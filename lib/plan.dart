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
          bottom: TabBar(
              controller: _tabController,
              tabs: weekData
                  .map((w) => Tab(text: "${w.month}/${w.day}(${w.dayOfWeek})"))
                  .toList())),
      body: TabBarView(
          controller: _tabController,
          children: weekData.map((w) => DayPlan(w.dayOfWeek)).toList()),
    );
  }
}

Widget DayPlan(dayOfWeek) {
  List<bool> selectedBool = List.generate(28, (i) => false);

  final items = List<int>.generate(28, (i) => i);
  final times = items
      .map((i) => {
            Text('${i + 7}:${(i.isOdd) ? '30' : '00'}',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
          })
      .toList();

  return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(36.0),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        if (i < 28) {
          return ListTile(
            title: Text('${times[i]}'),
            selected: selectedBool[i],
            onTap: () {
              selectedBool[i] = selectedBool[i] ? false : true;
            },
          );
        }
      });
}