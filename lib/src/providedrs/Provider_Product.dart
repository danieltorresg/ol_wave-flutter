import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_search_product.dart';

class ProductosProvider{

  //String _url = "blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.comipad";


  Future<List<SearchModel>> getProduct(String query) async{

    final url = "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/search?q=$query";

    final resp  = await http.get(url);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return[];

  }
}