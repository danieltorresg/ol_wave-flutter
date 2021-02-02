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

  Future getProduct_default() async {
    var valueAux = {
      "id": "MCO566836190",
      "name": "TV Samsung 58 pulgadas (147 cm) 4K Crystal UHD Smart TV",
      "brand": "Samsung",
      "thumbnail":
          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
      "pictures": [
        "https://i.linio.com/p/bb573cd7abd86e6f51df6ac6ac65a669-product.webp",
        "https://i.linio.com/p/07f9e5f95fb8c69d3bdc4fdf21458310-product.webp",
        "https://i.linio.com/p/913f1eb5ef2d09b8bc319850fa0fc126-product.webp",
        "https://i.linio.com/p/cc5a93262e89b28bdcc240819519edad-product.webp"
      ],
      "city": {"name": "Bogotá D.C", "code": "CO-DC"},
      "seller": {
        "id": "BS01",
        "name": "BlackStore",
        "logo": "nada por el momento"
      },
      "description":
          "Este televisor LED utiliza un nuevo tipo de luz en la pantalla, que lo hace súper delgado. ",
      "price": 1929000,
      "currency": "COP",
      "rating": 4,
    };
    return valueAux;
  }
}

class PostD {
  dynamic data;
  PostD.fromJson(this.data);
}

Future<PostD> fetchProductDetailProvider(http.Client client) async {
  final idProduct = '1';
  final response = await client.get(
      'https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/item/$idProduct');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PostD.fromJson(jsonDecode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
