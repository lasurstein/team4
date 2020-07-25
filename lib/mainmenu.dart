import 'package:flutter/material.dart';
import 'package:team4/avatar/avatormenu.dart';
import 'package:team4/kadai2.dart';
import 'package:team4/plan.dart';

class MainAppMenu extends StatefulWidget {
  @override
  _MainAppMenuState createState() => _MainAppMenuState();
}

class _MainAppMenuState extends State<MainAppMenu> {
  final List dinosaurs = [
    "eggDinosaur",
    "dinosaur_blue",
    "dinosaur_brown",
    "dinosaur_green",
    "dinosaur_red",
    "dinosaur_yellow",
  ];

  int dinosaurLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("スケジュール管理ゲーム"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.arrow_back), title: Text("Botton1")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.wb_sunny), title: Text("Botton2")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.arrow_forward), title: Text("Botton3")),
//        ],
//      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: Text(
                    "Level.${dinosaurLevel + 1} ${dinosaurs[dinosaurLevel].toString().toUpperCase()}",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1),
              Center(
                child: Image.asset(
                  "images/${dinosaurs[dinosaurLevel]}.png",
                  fit: BoxFit.fill,
                  width: 250,
                  height: 250,
                ),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return WeekPlanPage(); //予定入力のクラスを指定
                          },
                        ),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      "予定入力",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        dinosaurLevel = (dinosaurLevel + 1) % dinosaurs.length;
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text(
                            "Dinosaur\'s Level UP!",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.redAccent.shade200,
                        ));
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeWork();
                          },
                        ),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      "学習課題",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AvatarMenu();
                          },
                        ),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      "アバター",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
