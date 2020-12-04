import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Model_search_product.dart';

class ProductosProvider{

  String _url = "http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/search?q= ipad";


  Future<List<SearchModel>> getProduct(String query) async{

    //final url = http(_url,"");

    final resp  = await http.get(_url);

    final decodedData = json.decode(resp.body);
 
    print('prueba $resp');

    return [];

  }
}