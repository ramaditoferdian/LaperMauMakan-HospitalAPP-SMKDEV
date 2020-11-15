import 'package:flutter/material.dart';

class LayananPage extends StatefulWidget {
  @override
  LayananPageState createState() => LayananPageState();
}

class LayananPageState extends State<LayananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Layanan",
          style:
              TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
