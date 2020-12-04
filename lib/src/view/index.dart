import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/appbar.dart';
import 'package:old_wave_flutter/src/view/searchBar.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  //var dataQuemada = DataQuemada.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarApp(
          appBar: AppBar(),
        ),
        body: Container(
          child: ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SearchBar(),
                Text(
                  '¿Que deseas comprar hoy?',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.computer, size: 60),
                        title: Text('Computación',
                            style: TextStyle(fontSize: 30.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Ver'),
                            color: purpleMainColor,
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.phone, size: 60),
                        title:
                            Text('Celulares', style: TextStyle(fontSize: 30.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Android'),
                            onPressed: () {/* ... */},
                          ),
                          RaisedButton(
                            child: const Text('IOS'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.computer, size: 60),
                        title: Text('Electrodomesticos',
                            style: TextStyle(fontSize: 30.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Neveras'),
                            onPressed: () {/* ... */},
                          ),
                          RaisedButton(
                            child: const Text('Lavadoras'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.computer, size: 60),
                        title: Text('Perifericos',
                            style: TextStyle(fontSize: 30.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Mouse'),
                            onPressed: () {/* ... */},
                          ),
                          RaisedButton(
                            child: const Text('Teclados'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.computer, size: 60),
                        title: Text('Accesorios',
                            style: TextStyle(fontSize: 30.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Relojes'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
