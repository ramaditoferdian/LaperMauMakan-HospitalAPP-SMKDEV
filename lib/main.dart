import 'package:flutter/material.dart';

import 'package:hospital_app/ui/landing_page/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
