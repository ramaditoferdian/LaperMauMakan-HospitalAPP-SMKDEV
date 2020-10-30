import 'package:flutter/material.dart';

class MooreButton extends StatefulWidget {
  @override
  _MooreButtonState createState() => _MooreButtonState();
}

class _MooreButtonState extends State<MooreButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(" data"),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(transform: Matrix4.translationValues(0.0, 3.0, 0.0))
        ],
      ),
    );
  }
}
