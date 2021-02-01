import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/index.dart';
import 'package:old_wave_flutter/src/view/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Old Wave',
      home: InitialPage(),
    );
  }
}
