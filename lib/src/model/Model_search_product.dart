import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());


class Products{

  //This is the list with all product of the search
  List<Item> itemsProduct = new List();

  Products();

  Products.fromJsonList( List<dynamic> jsonList_net, List<dynamic> jsonList_django, List<dynamic> jsonList_node){

    if(jsonList_net == null) return;//If json it's null them return
    if(jsonList_django == null) return;//If json it's null them return

    //I take the crow json of product and convert to DartObject before add to itemsproduct
    for(var item in jsonList_net){

      //map de json to dart object
      final product = Item.fromJson(item);

      //add product to list itemsproduct
      itemsProduct.add(product);
    }
    
    for(var item in jsonList_django){

      //map de json to dart object
      final product = Item.fromJson(item);

      //add product to list itemsproduct
      itemsProduct.add(product);
    }
    
    for(var item in jsonList_node){

      //map de json to dart object
      final product = Item.fromJson(item);

      //add product to list itemsproduct
      itemsProduct.add(product);
    }

  }

}

class SearchModel {
    SearchModel({
        this.query,
        this.total,
        this.seller,
        this.items,
    });

    String query;
    int total;
    Seller seller;
    List<Item> items;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
        this.thumbnail,
        this.city,
        this.price,
        this.currency,
        this.rating,
    });

    String id;
    String name;
    String brand;
    String thumbnail;
    City city;
    double price;
    String currency;
    double rating;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"].toString(),
        name: json["name"],
        brand: json["brand"],
        thumbnail: json["thumbnail"],
        city: City.fromJson(json["city"]),
        price: json["price"].toDouble(),
        currency: json["currency"],
        rating: json["rating"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "thumbnail": thumbnail,
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