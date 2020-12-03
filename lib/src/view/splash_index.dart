import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/splash_appbar.dart';
import 'package:old_wave_flutter/src/view/splash_searchBar.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
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
