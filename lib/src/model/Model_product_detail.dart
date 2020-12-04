import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());



class ProductDetail {
  ProductDetail({
    this.id,
    this.name,
    this.brand,
    this.thubnail,
    this.pictures,
    this.city,
    this.seller,
    this.description,
    this.price,
    this.currency,
    this.rating,
  });

  int id;
  String name;
  String brand;
  String thubnail;
  List<String> pictures;
  City city;
  Seller seller;
  String description;
  int price;
  String currency;
  int rating;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id          : json["id"],
        name        : json["name"],
        brand       : json["brand"],
        thubnail    : json["thubnail"],
        pictures    : List<String>.from(json["pictures"].map((x) => x)),
        city        : City.fromJson(json["city"]),
        seller      : Seller.fromJson(json["seller"]),
        description : json["description"],
        price       : json["price"],
        currency    : json["currency"],
        rating      : json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id"          : id,
        "name"        : name,
        "brand"       : brand,
        "thubnail"    : thubnail,
        "pictures"    : List<dynamic>.from(pictures.map((x) => x)),
        "city"        : city.toJson(),
        "seller"      : seller.toJson(),
        "description" : description,
        "price"       : price,
        "currency"    : currency,
        "rating"      : rating,
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
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
