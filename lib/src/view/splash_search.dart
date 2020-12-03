import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:old_wave_flutter/src/view/splash_appbar.dart';
import 'package:old_wave_flutter/src/view/splash_searchBar.dart';

class CryptoData {
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

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var cryptoData = CryptoData.getData;
  var valueAux = {
    'name': 'Duvan',
    'symbol': 'DCA',
    'icon': Icons.backup,
    'iconColor': Colors.green,
    'change': '+1.2%',
    'changeValue': '20.567',
    'changeColor': Colors.pink,
    'value': '\$7.80900'
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarApp(
          appBar: AppBar(),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SearchBar(),
              Expanded(
                child: ListView.builder(
                    itemCount: cryptoData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 220,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 2.0,
                                    color: cryptoData[index]['iconColor']),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Stack(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  productIcon(
                                                      cryptoData[index]),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  productNameSymbol(
                                                      cryptoData[index]),
                                                  Spacer(),
                                                  productChange(
                                                      cryptoData[index]),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  changeIcon(cryptoData[index]),
                                                  SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  productAmount(
                                                      cryptoData[index])
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              FlatButton(
                onPressed: () => setState(() => {cryptoData.add(valueAux)}),
                child: Text('Cargar más'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
            'assets/user_icon.png',
            fit: BoxFit.fill,
          ),
      ),
    );
  }

  Widget productNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['symbol']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget productChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['change']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['changeValue']}',
                style: TextStyle(
                    color: data['changeColor'],
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget changeIcon(data) {
    return Align(
        alignment: Alignment.topRight,
        child: data['change'].contains('-')
            ? Icon(
                Icons.arrow_drop_down,
                color: data['changeColor'],
                size: 30,
              )
            : Icon(
                Icons.arrow_drop_up,
                color: data['changeColor'],
                size: 30,
              ));
  }

  Widget productAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n${data['value']}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n0.1349',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* class Search extends StatelessWidget {
  var cryptoData = CryptoData.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
// scrollDirection: Axis.horizontal,
                itemCount: cryptoData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 2.0,
                                color: cryptoData[index]['iconColor']),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              productIcon(cryptoData[index]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              productNameSymbol(
                                                  cryptoData[index]),
                                              Spacer(),
                                              productChange(cryptoData[index]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              changeIcon(cryptoData[index]),
                                              SizedBox(
                                                width: 20,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              productAmount(cryptoData[index])
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    )));
  }
} */

/* 

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Hola'),
    );
  }
} */
