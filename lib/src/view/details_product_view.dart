import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class CryptoData {
  static final getData = [
    {
      'name': 'Celular Samsung A50',
      'brand': 'Samsung',
      'ciudad': 'Medellín',
      'Precio': '750.000',
      'ResellerName': "Éxito",
      'ResellerLogo': Icons.android,
      'iconColor': Colors.blueAccent,
      'descripcion': 'Celular samsung con 4 gb de ram y 128 gb de interna',
      'rating': '5',
    },
  ];
}

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var cryptoData = CryptoData.getData;
  var valueAux = {
    'name': 'Celular Samsung A50',
    'brand': 'Samsung',
    'city': 'Medellín',
    'price': '750.000',
    'ResellerName': "Éxito",
    'ResellerLogo': Icons.android,
    'iconColor': Colors.blueAccent,
    'description': 'Celular samsung con 4 gb de ram y 128 gb de interna',
    'rating': '5',
  };

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
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: purpleMainColor,
                          size: 25,
                        ),
                        border: InputBorder.none,
                        hintText: "Search Products",
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 14.0)),
                  ),
                ),
                decoration: BoxDecoration(color: purpleMainColor),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 570,
                width: double.maxFinite,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/Mockup_Mobile.png'),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['name']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: purpleComplementaryColor,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['brand']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blueComplementaryColor,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['city']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blueComplementaryColor,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['price']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['ResellerName']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 19.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/user_icon.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${valueAux['description']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: '\n${'Rating:' + valueAux['rating']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ));
  }
}
