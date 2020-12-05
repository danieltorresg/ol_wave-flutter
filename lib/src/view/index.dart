import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/view/appbar.dart';
import 'package:old_wave_flutter/src/view/search.dart';
import 'package:old_wave_flutter/src/view/searchBar.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
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
                  textScaleFactor: 1.5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: purpleMainColor,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.computer, size: 60),
                        title: Text(
                          'Computación',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: purpleMainColor,
                          ),
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Computadores'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'computador'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Mouse'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'mouse'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Teclados'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'teclados'),
                                ),
                              );
                            },
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
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.phone_android, size: 60),
                        title: Text('Celulares',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: purpleMainColor,
                            )),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Android'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'celular'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('IOS'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'iphone'),
                                ),
                              );
                            },
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
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.tv, size: 60),
                        title: Text('Electrodomesticos',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: purpleMainColor,
                            )),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Neveras'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'nevera'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Lavadoras'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'lavadora'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Televisores'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'televisor'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Hornos'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'horno'),
                                ),
                              );
                            },
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
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.headset, size: 60),
                        title: Text('Accesorios',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: purpleMainColor,
                            )),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Relojes'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'reloj'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Audifonos'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'audifonos'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Gafas'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'gafas'),
                                ),
                              );
                            },
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
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.motorcycle, size: 60),
                        title: Text('Vehiculos',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: purpleMainColor,
                            )),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Carros'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'carro'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Motos'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Search(search: 'moto'),
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            child: const Text('Bicicletas'),
                            color: purpleMainColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Search(search: 'bicicleta'),
                                ),
                              );
                            },
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
