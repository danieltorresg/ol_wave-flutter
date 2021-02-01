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
}

class Post {
  dynamic data;
  Post.fromJson(this.data);
}

Future<Post> fetchProductosProvider(http.Client client) async {
  final itemToSearch = 'tv';
  final response = await client.get(
      'https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/search/?q=$itemToSearch');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
