import 'package:flutter/material.dart';

class AvatarMenu extends StatefulWidget {
  @override
  _AvatarMenuState createState() => _AvatarMenuState();
}

class _AvatarMenuState extends State<AvatarMenu> {
  final List dinosaurs = [
    "eggDinosaur",
    "dinosaur_blue",
    "dinosaur_brown",
    "dinosaur_green",
    "dinosaur_red",
    "dinosaur_yellow",
  ];

  int dinosaurLevel = 0;

  String dinosaurName = "Pochi";

  int _nowAvatorPage;
  Widget _avatorPage;

  @override
  void initState() {
    super.initState();
    this._avatorPage = AvatarMenu1(move: moveAvator);
    this. _nowAvatorPage = 1;
  }

  void moveAvator(int page) {
    setState(() {

      if (page == 1) {
        this._avatorPage = AvatarMenu1(move: moveAvator);
      } else if (page == 2){
        this._avatorPage = AvatarMenu2(move: moveAvator);
      } else {
        this._avatorPage = AvatarMenu3(move: moveAvator);
      }

      this. _nowAvatorPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("アバターメニュー"),
      ),
      body: _avatorPage
    );
  }
}

class AvatarMenu1 extends StatefulWidget {
  AvatarMenu1({this.move});
  final void Function(int) move;

  @override
  _AvatarMenu1State createState() => _AvatarMenu1State();
}

class _AvatarMenu1State extends State<AvatarMenu1> {

  final List dinosaurs = [
    "eggDinosaur",
    "dinosaur_blue",
    "dinosaur_brown",
    "dinosaur_green",
    "dinosaur_red",
    "dinosaur_yellow",
  ];

  int dinosaurLevel = 0;

  String dinosaurName = "Pochi";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "$dinosaurName",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.lightBlue,
                    onPressed: () {
                      widget.move(3);
                    },
                    icon: Icon(Icons.chevron_left)
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset(
                          "images/${dinosaurs[dinosaurLevel]}.png",
                          fit: BoxFit.fill,
                          width: 250,
                          height: 250,
                        ),
                      ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.lightBlue,
                    onPressed: () {
                      widget.move(2);
                    },
                    icon: Icon(Icons.chevron_right),
                  )
                ]
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  体力",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "4",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  学力",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "20",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  身長",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  体重",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  かっこよさ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  かわいさ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
//            Spacer(),
            TextField(
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              decoration: InputDecoration(
                //prefixText: "Dinosaur's name : ",
                  prefixIcon: Icon(Icons.pets)),
              onChanged: (String value) {
                try {
                  setState(() {
                    dinosaurName = value;
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                        "Dinosaur\'s name chaged!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.redAccent.shade200,
                    ));
                  });
                  //_billAmount = double.parse(value);
                } catch (exception) {
                  setState(() {
                    dinosaurName = "pochi";
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


class AvatarMenu2 extends StatelessWidget {
  AvatarMenu2({this.move});

  final void Function(int) move;

  final List dinosaurs = [
    "eggDinosaur",
    "dinosaur_blue",
    "dinosaur_brown",
    "dinosaur_green",
    "dinosaur_red",
    "dinosaur_yellow",
  ];

  int dinosaurLevel = 0;

  String dinosaurName = "キング";

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "$dinosaurName",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.lightBlue,
                      onPressed: () {
                        move(1);
                      },
                      icon: Icon(Icons.chevron_left),
                    ),
                    Expanded(
                        flex: 1,
                        child:
                    Center(
                      child: Image.asset(
                        "images/${dinosaurs[4]}.png",
                        fit: BoxFit.fill,
                        width: 250,
                        height: 250,
                      ),
                    ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.lightBlue,
                      onPressed: () {
                        move(3);
                      },
                      icon: Icon(Icons.chevron_right),
                    )
                  ]
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  体力",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  学力",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "80",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  身長",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  体重",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "10",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  かっこよさ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "  かわいさ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
    );
  }
}


class AvatarMenu3 extends StatelessWidget {
  AvatarMenu3({this.move});

  final void Function(int) move;

  final List dinosaurs = [
    "eggDinosaur",
    "dinosaur_blue",
    "dinosaur_brown",
    "dinosaur_green",
    "dinosaur_red",
    "dinosaur_yellow",
  ];

  int dinosaurLevel = 0;

  String dinosaurName = "ゴッドザウルス";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "$dinosaurName",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.lightBlue,
                    onPressed: () {
                      move(2);
                    },
                    icon: Icon(Icons.chevron_left),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        "images/${dinosaurs[5]}.png",
                        fit: BoxFit.fill,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.lightBlue,
                    onPressed: () {
                      move(1);
                    },
                    icon: Icon(Icons.chevron_right),
                  ),
                ]
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  体力",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  学力",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "999",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  身長",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "999",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  体重",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "999",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  かっこよさ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "999",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          "  かわいさ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "999",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}