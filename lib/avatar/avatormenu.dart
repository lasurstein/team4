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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("アバターメニュー"),
      ),
      body: Builder(
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
              Center(
                child: Image.asset(
                  "images/${dinosaurs[dinosaurLevel]}.png",
                  fit: BoxFit.fill,
                  width: 250,
                  height: 250,
                ),
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
