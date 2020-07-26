import 'package:flutter/material.dart';
import 'kadai2.dart';

class WeekPlanPage extends StatefulWidget {
  WeekPlanPage({Key key}) : super(key: key);

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
  int _selectTabIndex = 0;

  static DateTime _now = DateTime.now();
  static DateTime _thisWeekMonday =
  _now.subtract(new Duration(days: _now.weekday - 1));

  final timeList = [
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22
  ];

  static _WeekPlanPageState of(BuildContext context) {
    return context.ancestorStateOfType(TypeMatcher<_WeekPlanPageState>());
  }

  List<List<bool>> _selectedTime = List.generate(
      7, (_) => List.generate(31, (_) => false));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      setState(() {
        _selectTabIndex = _tabController.index;
      });

      print("Selected Index: " + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void selectItems(int numberOfWeek, int time) {
    print(_selectedTime[numberOfWeek][time]);
    setState(() => {
      _selectedTime[numberOfWeek][time] =
      (_selectedTime[numberOfWeek][time]) ? false : true
    });
    print(
        '${numberOfWeek}, ${time} pushed. after:${_selectedTime[numberOfWeek][time]}');
  }

  void selectTabs() {

  }

  final List<DayOfWeek> weekData = [
    DayOfWeek(
        month: _thisWeekMonday.month,
        day: _thisWeekMonday.day,
        dayOfWeek: '月',
        numberOfWeek: 1),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 1))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 1))
            .day,
        dayOfWeek: '火',
        numberOfWeek: 2),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 2))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 2))
            .day,
        dayOfWeek: '水',
        numberOfWeek: 3),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 3))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 3))
            .day,
        dayOfWeek: '木',
        numberOfWeek: 4),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 4))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 4))
            .day,
        dayOfWeek: '金',
        numberOfWeek: 5),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 5))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 5))
            .day,
        dayOfWeek: '土',
        numberOfWeek: 6),
    DayOfWeek(
        month: _thisWeekMonday
            .add(new Duration(days: 6))
            .month,
        day: _thisWeekMonday
            .add(new Duration(days: 6))
            .day,
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
                  .map((w) =>
                  Tab(child: Container(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("${w.dayOfWeek}", style: TextStyle(fontSize: (_selectTabIndex == w.numberOfWeek - 1) ? 20.0 : 20.0)),
                        if(_selectTabIndex == w.numberOfWeek - 1) Text("${w.month}/${w.day}", style: TextStyle(fontSize: 10.0)),
                      ]))))
                  .toList())),
      body: TabBarView(
          controller: _tabController,
          children: weekData.map((w) =>
              DayPlan(weekDate: w,
                  selectedTimeOfDay: _selectedTime[w.numberOfWeek - 1],
                  itemSelector: selectItems)).toList()
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                print(_selectedTime);
                return HomeWork(planTimes: _selectedTime);
              },
            ),
          );
        },
        label: Text('完了！'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.green,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DayPlan extends StatelessWidget {
  DayPlan({this.weekDate, this.selectedTimeOfDay, this.itemSelector});

  final DayOfWeek weekDate;
  final List<bool> selectedTimeOfDay;
  final void Function(int, int) itemSelector;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          if (i < 31) {
            return new Container (
                child: ListTileTheme(
                    selectedColor: Colors.grey,
                    child: ListTile(
                      title: Text('${(7 + (i - i % 2) / 2).round()}:${i.isOdd
                          ? '30'
                          : '00'}', textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0)),
                      selected: selectedTimeOfDay[i],
                      onTap: () {
                        _WeekPlanPageState.of(context).selectItems(
                            weekDate.numberOfWeek - 1, i);
                      },
                    )),
                decoration: new BoxDecoration(
                  color: selectedTimeOfDay[i]
                      ? Colors.deepOrange[100]
                      : Colors.transparent,
                  border: new Border(
                    bottom: new BorderSide(
                      color: Color(0xFFC0C0C0),
                    ),
                  ),
                )
            );
          }
        });
  }
}