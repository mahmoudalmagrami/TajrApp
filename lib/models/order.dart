// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  final int? id;
  final int? amount;
  final int? totalAmount;
  final int? deliveryAmount;
  final String? deliveryType;
  final String? status;
  final String type;
  final IdName? address;
  final List<Product>? products;

  Order({
    this.id,
    this.amount,
    this.totalAmount,
    this.deliveryAmount,
    this.deliveryType,this.type='',
    this.status,
    this.address,
    this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    amount: json["amount"],
    totalAmount: json["total_amount"],
    deliveryAmount: json["delivery_amount"],
    deliveryType: json["delivery_type"],
    type: json["type"]??'',
    status: json["status"],
    address: json["address"] == null ? null : IdName.fromJson(json["address"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "total_amount": totalAmount,
    "delivery_amount": deliveryAmount,
    "delivery_type": deliveryType,
    "status": status,
    "address": address?.toJson(),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class IdName {
  final int? id;
  final String? name;

  IdName({
    this.id,
    this.name,
  });

  factory IdName.fromJson(Map<String, dynamic> json) => IdName(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Product {
  final int? id;
  final int quantity,remainingQuantity;
  final String? name;
  final int? price;
  final String? unit;
  final IdName? category;

  Product({
    this.id,
    this.quantity=0,this.remainingQuantity=0,
    this.name,
    this.price,
    this.unit,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    quantity: json["quantity"]??0,
    remainingQuantity: json["remaining_quantity"]??0,
    name: json["name"],
    price: json["price"],
    unit: json["unit"],
    category: json["category"] == null ? null : IdName.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "name": name,
    "price": price,
    "unit": unit,
    "category": category?.toJson(),
  };
}
