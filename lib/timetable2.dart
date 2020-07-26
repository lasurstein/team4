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
        title: Text(''),
      ),
      body: TimetableView(
        laneEventsList: _buildLaneEvents(),
      ),
    );
  }

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(name: '月'),
        events: [
          TableEvent(
            title: '',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 8, minute: 0),
            end: TableEventTime(hour: 16, minute: 0),
          ),

        ],
      ),
      LaneEvents(
        lane: Lane(name: '火'),
        events: [
          TableEvent(
            title: '',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 8, minute: 00),
            end: TableEventTime(hour: 18, minute: 30),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: '水'),
        events: [
          TableEvent(
            title: '',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 8, minute: 00),
            end: TableEventTime(hour: 18, minute: 30),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: '木'),
        events: [
          TableEvent(
            title: '',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 8, minute: 00),
            end: TableEventTime(hour: 18, minute: 30),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: '金'),
        events: [
          TableEvent(
            title: '',
            backgroundColor: Colors.redAccent,
            start: TableEventTime(hour: 8, minute: 00),
            end: TableEventTime(hour: 18, minute: 30),
          ),
        ],
      ),


    ];
  }
}


//    LaneEvent(occupy: widget.occ) {
//      for ( int i = 0; int j = 0;i < widget.occ[i].length; i++){
//        for (int j = 0;j < 27; j++){
//          if (widget.occ[i][j] == true) {
//            return LaneEvents(lane: Lane(name: "$i"), events: [TableEvent(
//                backgroundColor: Colors.redAccent,
//                start: TableEventTime(hour: 2, minute: 30 * (j % 2)),
//                end: TableEventTime(hour: 3, minute: 30 * ((j + 1) % 2))
//            )]
//            );
//          }
//        }
//      }
//    }

