import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';
import 'package:old_wave_flutter/src/model/Model_search_product.dart';
import 'package:old_wave_flutter/src/providedrs/Provider_Product.dart';
import 'package:old_wave_flutter/src/view/appbar.dart';
import 'package:old_wave_flutter/src/view/searchBar.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ProductosProvider provider = ProductosProvider();
  var productList = [
    {
      "id": "MCO566836190",
      "name": "Nevera",
      "brand": "Oster",
      "thubnail":
          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
    {
      "id": "MCO566836191",
      "name": "Nevera",
      "brand": "Oster",
      "thubnail":
          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
    {
      "id": "MCO566836192",
      "name": "Nevera",
      "brand": "Oster",
      "thubnail":
          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
  ];

  Widget productsWidget() {
    return FutureBuilder(
      future: provider.getProduct_net_default(productList),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          if (products.length == 0) {
            return Center(
              child: Text("No hay productos"),
            );
          }
          return showProducts(products);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
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
              productsWidget(),
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
          '${data.thumbnail}',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget productName(data) {
    final texto = data.name.toString();
    return Container(
      padding: EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            texto,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),
          ),
          Text('${data.brand}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),

      /* text: TextSpan(
          text: '${data.name}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '${data.brand}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ), */
    );
  }

  Widget productChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data.price}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: purpleMainColor,
              fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data.currency}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                text: '\n${data.rating}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget showProducts(productsData) {
    return Expanded(
      child: ListView.builder(
          itemCount: productsData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 200,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () => {
                    /* print("Abriendo producto" + productsData[index].id),
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        id: productsData[index].id,
                      ),
                    )) */
                    print(productList),
                    productList.add({
                      "id": "MCO566836191",
                      "name": "Neverazo",
                      "brand": "Oster",
                      "thubnail":
                          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
                      "city": {"name": "Medellin", "code": "MED"},
                      "price": 0.0,
                      "currency": "COP",
                      "rating": 0.0,
                    })
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          productImage(productsData[index]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          productName(productsData[index]),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          productChange(productsData[index]),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          changeIcon(productsData[index]),
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
    );
  }
}
