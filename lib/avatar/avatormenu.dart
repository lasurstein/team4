import 'package:flutter/material.dart';

class AvatarMenu extends StatefulWidget {
  @override
  _AvatarMenuState createState() => _AvatarMenuState();
}

class _AvatarMenuState extends State<AvatarMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("アバターメニュー"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
