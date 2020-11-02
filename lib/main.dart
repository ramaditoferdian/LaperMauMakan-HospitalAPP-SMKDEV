import 'package:flutter/material.dart';

import 'package:hospital_app/ui/landing_page/landing_page.dart';

import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
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
