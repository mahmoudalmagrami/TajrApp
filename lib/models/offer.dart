// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  final int? id;
  final String? name;
  final String? price;
  final String? details;
  final String? image;
  final List<ProductOffer> products;

  Offer({
    this.id,
    this.name,
    this.price,
    this.details,
    this.image,
    this.products=const[],
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    details: json["details"],
    image: json["image"],
    products: json["products"] == null ? [] : List<ProductOffer>.from(json["products"]!.map((x) => ProductOffer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "details": details,
    "image": image,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class ProductOffer {
  final int id;
  final String name;
  final String image;

  ProductOffer({
    this.id=0,
    this.name='',this.image=''
  });

  factory ProductOffer.fromJson(Map<String, dynamic> json) => ProductOffer(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
