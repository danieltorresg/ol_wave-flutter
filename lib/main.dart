import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/splash_view.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Old Wave',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Funciona'),
    );
  }
}

