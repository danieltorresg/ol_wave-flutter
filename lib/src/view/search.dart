import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:old_wave_flutter/src/view/appbar.dart';
import 'package:old_wave_flutter/src/view/splash_searchBar.dart';
import 'package:old_wave_flutter/src/view/details_product_view.dart';

class CryptoData {
  static final retorno = {
    "query": "computador",
    "total": 10,
    "seller": {
      "id": 5,
      "name": "django_api",
      "logo": "https://www.django-rest-framework.org/img/logo.png"
    },
    "items": [
      {
        "id": "5fc8fdcac8f3616c3fdb3908",
        "name": "computador",
        "brand": "Adata XPG",
        "thumbnail":
            "http://mco-s1-p.mlstatic.com/918211-MCO42704536631_072020-I.jpg",
        "city": {"name": "Medellín", "code": "MED"},
        "price": 2649900.0,
        "currency": "COP",
        "rating": 0.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb3909",
        "name": "computador",
        "brand": "Acer",
        "thumbnail":
            "http://mco-s2-p.mlstatic.com/830497-MCO43559197713_092020-I.jpg",
        "city": {"name": "Cali", "code": "CL"},
        "price": 1779000.0,
        "currency": "COP",
        "rating": 5.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390a",
        "name": "computador",
        "brand": "Lenovo",
        "thumbnail":
            "http://mco-s2-p.mlstatic.com/690248-MCO42347578960_062020-I.jpg",
        "city": {"name": "Bogotá", "code": "BOG"},
        "price": 3299000.0,
        "currency": "COP",
        "rating": 4.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390b",
        "name": "computador",
        "brand": "Asus",
        "thumbnail":
            "http://mco-s2-p.mlstatic.com/807565-MCO43129304238_082020-I.jpg",
        "city": {"name": "Bogotá", "code": "BOG"},
        "price": 1500000.0,
        "currency": "COP",
        "rating": 2.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390c",
        "name": "computador",
        "brand": "XPG",
        "thumbnail":
            "http://mco-s2-p.mlstatic.com/976870-MCO44033540850_112020-I.jpg",
        "city": {"name": "Bogotá", "code": "BOG"},
        "price": 2649000.0,
        "currency": "COP",
        "rating": 1.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390d",
        "name": "computador",
        "brand": "Compumax",
        "thumbnail":
            "http://mco-s1-p.mlstatic.com/824118-MCO43504732352_092020-I.jpg",
        "city": {"name": "Medellín", "code": "MED"},
        "price": 1749900.0,
        "currency": "COP",
        "rating": 1.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390e",
        "name": "computador",
        "brand": "Dell",
        "thumbnail":
            "http://mco-s1-p.mlstatic.com/666899-MCO44044201095_112020-I.jpg",
        "city": {"name": "Bogotá", "code": "BOG"},
        "price": 1991900.0,
        "currency": "COP",
        "rating": 4.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb390f",
        "name": "computador",
        "brand": "core i5",
        "thumbnail":
            "http://mco-s1-p.mlstatic.com/926713-MCO44133268996_112020-I.jpg",
        "city": {"name": "Cali", "code": "CL"},
        "price": 2699900.0,
        "currency": "COP",
        "rating": 5.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb3910",
        "name": "computador",
        "brand": "Lenovo",
        "thumbnail":
            "http://mco-s1-p.mlstatic.com/791659-MCO41799731157_052020-I.jpg",
        "city": {"name": "Bogotá", "code": "BOG"},
        "price": 3499900.0,
        "currency": "COP",
        "rating": 2.0
      },
      {
        "id": "5fc8fdcac8f3616c3fdb3911",
        "name": "computador",
        "brand": "HP",
        "thumbnail":
            "http://mco-s2-p.mlstatic.com/690899-MCO43691779911_102020-I.jpg",
        "city": {"name": "Medellín", "code": "MED"},
        "price": 1600000.0,
        "currency": "COP",
        "rating": 1.0
      }
    ]
  };
}

class Search extends StatefulWidget {
  Search({Key key, this.search}) : super(key: key);
  final String search;



  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;
  var _datosCompletos = CryptoData.retorno["items"] as List;
  
  @override
  void initState() {
    _controller = TextEditingController(text: this.widget.search);
    print(_controller.text);
    super.initState();
  }
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
                    itemCount: _datosCompletos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 200,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () => {
                              print("Abriendo producto" +
                                  _datosCompletos[index]['id']),
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsPage(id: _datosCompletos[index]['id'],),
                              ))
                            },
                            child: Container(
                              /* decoration: BoxDecoration(
                                  color: Colors.white, //fondo
                                  ), */
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    productImage(
                                                        _datosCompletos[index]),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    productNameSymbol(
                                                        _datosCompletos[index]),
                                                    Spacer(),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    productChange(
                                                        _datosCompletos[index]),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    changeIcon(
                                                        _datosCompletos[index]),
                                                    SizedBox(
                                                      width: 20,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              FlatButton(
                onPressed: () => setState(() => {print("Cargandos")}),
                child: Text('Cargar más'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productImage(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.network(
          '${data['thumbnail']}',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget productNameSymbol(data) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '${data['brand']}',
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
          text: '${data['price']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['currency']}',
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
      child: RichText(
        text: TextSpan(
          text: 'Raiting',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['rating']}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
