import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_search_product.dart';

class ProductosProvider{


  Future<List<Item>> getProduct_net(String query) async{

    final url = "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/search?q=$query";

    final resp  = await http.get(url);

    final decodedData = json.decode(resp.body);

    final product = Products.fromJsonList(decodedData['items']);

    return product.itemsProduct;

  }

    Future<List<Item>> getProduct_django(String query) async{

    final url = "http://development.eba-2veq4gdy.us-west-2.elasticbeanstalk.com/django_api/search/?q=$query";

    final resp  = await http.get(url);

    final decodedData = json.decode(resp.body);

    final product = Products.fromJsonList(decodedData['items']);

    print(decodedData);
    return product.itemsProduct;

  }

}