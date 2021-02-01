import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_product_detail.dart';

class DetailsProvider {
  Future getProduct(String idProduct) async {
    final urlDjango =
        "http://production.eba-2veq4gdy.us-west-2.elasticbeanstalk.com/django_api/item/$idProduct";
    final urlNet =
        "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/item/$idProduct";
    final urlNode =
        "https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/item/$idProduct";

    final respDjango = await http.get(urlDjango);
    final respNet = await http.get(urlNet);
    final respNode = await http.get(urlNode);

    if (!respDjango.body.toString().contains("item not found")) {
      final decodedData = json.decode(respDjango.body);
      final details = ProductDetail.fromJson(decodedData);
      return details;
    }
    if (respNet.body.toString() != "") {
      final decodedData = json.decode(respNet.body);
      final details = ProductDetail.fromJson(decodedData);
      return details;
    }
    if (!respNode.body.toString().contains("No existe el producto")) {
      final decodedData = json.decode(respNode.body);
      final details = ProductDetail.fromJson(decodedData);
      return details;
    }
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
