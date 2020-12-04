import 'dart:convert';

SearchProduct searchProductFromJson(String str) =>
    SearchProduct.fromJson(json.decode(str));

String searchProductToJson(SearchProduct data) => json.encode(data.toJson());

class SearchProduct {
  SearchProduct({
    this.query,
    this.total,
    this.seller,
    this.items,
  });

  String query;
  int total;
  Seller seller;
  List<Item> items;

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        query: json["query"],
        total: json["total"],
        seller: Seller.fromJson(json["seller"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "total": total,
        "seller": seller.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.brand,
    this.thubnail,
    this.city,
    this.price,
    this.currency,
    this.rating,
  });

  int id;
  String name;
  String brand;
  String thubnail;
  City city;
  int price;
  String currency;
  int rating;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        thubnail: json["thubnail"],
        city: City.fromJson(json["city"]),
        price: json["price"],
        currency: json["currency"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "thubnail": thubnail,
        "city": city.toJson(),
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
  });

  String id;
  String name;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
