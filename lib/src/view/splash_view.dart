import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';
import 'package:old_wave_flutter/src/view/splash_appbar.dart';
import 'package:old_wave_flutter/src/view/splash_search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarApp(
        appBar: AppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SearchBar(),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/oldwave-logo-vertical.png'),
                    scale: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
