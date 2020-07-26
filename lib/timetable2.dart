import 'package:flutter/material.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'plan.dart';


//class TimeTab extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Timetabel View Demo',
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: MyHomePage(),
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key}) : super(key: key);
  MyHomePage({this.sub,this.occ});
  final String sub;
  final List<List<bool>> occ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timetable View Demo'),
      ),
      body: TimetableView(
        laneEventsList: _buildLaneEvents(),
      ),
    );

  }

  List<LaneEvents> _buildLaneEvents() {
    return [
      _LaneEvent(),
      LaneEvents(
        lane: Lane(name: '月'),
        events: [
          TableEvent(
            title: 'An event 1',
            start: TableEventTime(hour: 8, minute: 0),
            end: TableEventTime(hour: 10, minute: 0),
          ),
          TableEvent(
            title: 'An event 2',
            start: TableEventTime(hour: 12, minute: 0),
            end: TableEventTime(hour: 13, minute: 20),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: '火'),
        events: [
          TableEvent(
            title: 'An event 3',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 10, minute: 10),
            end: TableEventTime(hour: 11, minute: 45),
          ),
        ],
      ),


    ];
    LaneEvent() {
      for ( int i = 0; i < widget.occ[i].length; i++){
        for (int j = 0;j < 27; j++){
          if (widget.occ[i][j] == true) {
            return LaneEvents(lane: Lane(name: "$i"), events: [TableEvent(
                backgroundColor: Colors.redAccent,
                start: TableEventTime(hour: 2, minute: 30 * (j % 2)),
                end: TableEventTime(hour: 3, minute: 30 * ((j + 1) % 2))
            )]
            );
          }
        }
      }
    }


