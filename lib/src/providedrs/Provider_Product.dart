import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_search_product.dart';

class ProductosProvider {
  Future<List<Item>> getProduct_net(String query) async {
    final url_net =
        "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/search?q=$query";
    final resp_net = await http.get(url_net);
    final decodedData_net = json.decode(resp_net.body);

    final url_django =
        "http://development.eba-2veq4gdy.us-west-2.elasticbeanstalk.com/django_api/search/?q=$query";
    final resp_django = await http.get(url_django);
    final decodedData_django = json.decode(resp_django.body);

    final url_node =
        "https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/search/?q=$query";
    final resp_node = await http.get(url_node);
    final decodedData_node = json.decode(resp_node.body);

    final totalProducts = Products.fromJsonList(decodedData_net['items'],
        decodedData_django['items'], decodedData_node['items']);

    return totalProducts.itemsProduct;
  }

  Future<List<Item>> getProduct_net_default() async {
    List<Item> cartList = new List();
    var productList = [
    {
      "id": "MCO566836190",
      "name": "Nevera",
      "brand": "Oster",
      "thumbnail":
          "https://www.lg.com/co/images/neveras/md06059016/thumbnail/350_1_new.jpg",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
    {
      "id": "MCO566836191",
      "name": "Olla",
      "brand": "Oster",
      "thumbnail":
          "https://static.interbankbenefit.pe/public/web/images/producto/ficha-tecnica/68920-ficha-tecnica.png",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
    {
      "id": "MCO566836192",
      "name": "Estufa",
      "brand": "Oster",
      "thumbnail":
          "https://e39a9f00db6c5bc097f9-75bc5dce1d64f93372e7c97ed35869cb.ssl.cf1.rackcdn.com/img-RZEiufB5.jpg",
      "city": {"name": "Medellin", "code": "MED"},
      "price": 0.0,
      "currency": "COP",
      "rating": 0.0,
    },
  ];

    for (var item in productList) {
      //map de json to dart object
      final product = Item.fromJson(item);

      //add product to list cartList
      cartList.add(product);
    }

    return cartList;
  }
}
