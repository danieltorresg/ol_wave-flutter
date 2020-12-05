import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_product_detail.dart';

class DetailsProvider {
  Future getProduct(String idProduct) async {
    final url =
        "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/item/$idProduct";

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final details = ProductDetail.fromJson(decodedData);

    return details;
  }

  /*Future getProduct_net(String idProduct) async {
    final url =
        "";

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    // final product = Products.fromJsonList(decodedData['items']);

    final details = ProductDetail.fromJson(decodedData);

    return details;
  }

  Future getProduct_net(String idProduct) async {
    final url =
        "";"

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    // final product = Products.fromJsonList(decodedData['items']);

    final details = ProductDetail.fromJson(decodedData);

    return details;
  }*/
}
