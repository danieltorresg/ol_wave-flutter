import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductsDetail {
//   //This is the list with all product of the search
  List<ProductDetail> itemsProduct = new List();

  ProductsDetail();

  ProductsDetail.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return; //If json it's null them return

    //I take the crow json of product and convert to DartObject before add to itemsproduct
    for (var item in jsonList) {
      //map de json to dart object
      final product = ProductDetail.fromJson(item);

      //add product to list itemsproduct
      itemsProduct.add(product);
    }
  }
}

class ProductDetail {
  ProductDetail({
    this.id,
    this.name,
    this.brand,
    this.thumbnail,
    this.pictures,
    this.city,
    this.seller,
    this.description,
    this.price,
    this.currency,
    this.rating,
  });

  String id;
  String name;
  String brand;
  String thumbnail;
  List<String> pictures;
  City city;
  Seller seller;
  String description;
  double price;
  String currency;
  double rating;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"].toString(),
        name: json["name"],
        brand: json["brand"],
        thumbnail: json["thumbnail"],
        //pictures: List<String>.from(json["pictures"].map((x) => x)),
        city: City.fromJson(json["city"]),
        seller: Seller.fromJson(json["seller"]),
        description: json["description"],
        price: json["price"].toDouble(),
        currency: json["currency"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "thumbnail": thumbnail,
        //"pictures": List<dynamic>.from(pictures.map((x) => x)),
        "city": city.toJson(),
        "seller": seller.toJson(),
        "description": description,
        "price": price,
        "currency": currency,
        "rating": rating,
      };
}

class City {
  City({
    this.name,
    this.code,
  });

  String name;
  String code;

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Seller {
  Seller({
    this.id,
    this.name,
    this.logo,
  });

  String id;
  String name;
  String logo;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"].toString(),
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
