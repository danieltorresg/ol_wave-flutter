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
      "name":
          "televisor samsung 58 pulgadas 147 cm 58tu8000 led 4k uhd crystal",
      "brand": "Samsung",
      "thumbnail":
          "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-I.jpg",
      "pictures": [
        "http://mco-s1-p.mlstatic.com/658727-MCO42366015634_062020-O.jpg"
      ],
      "city": {"name": "Bogotá D.C", "code": "CO-DC"},
      "seller": {
        "id": "BS01",
        "name": "BlackStore",
        "logo": "nada por el momento"
      },
      "description":
          "Este televisor LED utiliza un nuevo tipo de luz en la pantalla, que lo hace súper delgado. Niveles de negro más profundos. Ideal para instalarlo en la pared. Perfecto para habitaciones claras y para tener la mejor experiencia de cine en casa. Ayuda al ahorro de energía. Pantalla Crystal Display Sumérgete en tus contenidos con una gama de colores mucho más amplia. La pantalla Crystal Display garantiza una expresión de colores optimizada para que no te pierdas ningún detalle. Su increíble calidad de imagen es posible gracias al procesador Crystal UHD 4K, el cual ofrece amplia gama de colores vivos y vibrantes, optimiza el contraste en escenas oscuras y permite equilibrar el brillo de los contenidos gracias a su Alto Rango Dinámico (HDR) Diseño elegante para que veas las imágenes sin límites. Fabricado con un estilo minimalista impecable de marcos ultradelgados que establece estándares nuevos en diseño. Podrás disfrutar de la experiencia cinematográfica más inmersiva que hayas vivido. La tecnología de Alto Rango Dinámico (HDR) optimiza la regulación de brillo del televisor para que puedas disfrutar de un inmenso espectro de colores y detalles visuales, incluso en las escenas más oscuras. Gracias a que tiene AirPlay 2 integrado, puedes transmitir o compartir contenido desde dispositivos Apple en la pantalla grande. Puedes reproducir videos, música, fotografías y más sin esfuerzo desde tu iPhone, iPad y Mac en tu televisor Samsung.",
      "price": 1819900,
      "currency": "COP",
      "rating": 3,
    };
    return valueAux;
  }
}