import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/splash_appbar.dart';
import 'package:old_wave_flutter/src/view/splash_searchBar.dart';

class DataQuemada {
  static final getData = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'icon': Icons.account_box,
      'iconColor': Colors.orange,
      'change': '+3.67%',
      'changeValue': '+202.835',
      'changeColor': Colors.green,
      'value': '\$12.279',
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'icon': Icons.account_circle,
      'iconColor': Colors.black,
      'change': '+5.2%',
      'changeValue': '25.567',
      'changeColor': Colors.green,
      'value': '\$7.809'
    },
    {
      'name': 'Andrea',
      'symbol': 'AOG',
      'icon': Icons.android,
      'iconColor': Colors.blueAccent,
      'change': '+1.2%',
      'changeValue': '20.567',
      'changeColor': Colors.brown,
      'value': '\$7.80900'
    },
  ];
}

class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var dataQuemada = DataQuemada.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarApp(
          appBar: AppBar(),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SearchBar(),
                Expanded(
                  child: ListView.builder(
                      itemCount: dataQuemada.length,
                      itemBuilder: (context, index) {}),
                )
              ]),
        ),
      ),
    );
  }
}
