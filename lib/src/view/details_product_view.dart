import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset(
          'assets/oldwave-logo-horizontal.png',
          fit: BoxFit.cover,
          scale: 2,
        ),

        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: purpleMainColor,
              onPressed: () {},
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/user_icon.png'),
            color: purpleMainColor,
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: blueComplementaryColor,
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              cursorColor: Colors.grey,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 16,
                  ),
                  border: InputBorder.none,
                  hintText: "Search Products",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      )),
    );
  }
}
