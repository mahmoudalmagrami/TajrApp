// class Item {
//   final String name;
//   final String id;
//    int price,quantity;
//   int favorite;
//   final String ImageUrl;
//
//   Item({
//       required this.name,
//     required this.price,
//       required this.id,
//       required this.favorite,
//       required this.ImageUrl,this.quantity=1
//   });
// }

// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  final int id;
  final String unit;
  final double unitPrice;
  final int? batchNumber;
  final String? purchasingPrice;
  final DateTime? productionDate;
  final DateTime? expiryDate;
   int quantity=0;
  final int? isActive;
  int fav=0;

  final int remainingQuantity;
  final int? productId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  Item({
    this.id=0,
    this.unit='',
    this.unitPrice=0.0,
    this.batchNumber,
    this.purchasingPrice,
    this.productionDate,
    this.expiryDate,
    this.quantity=0,this.fav=0,
    this.isActive,
    this.remainingQuantity=0,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    unit: json["unit"],
    unitPrice: json["unit_price"]?.toDouble(),
    batchNumber: json["batch_number"],
    purchasingPrice: json["purchasing_price"],
    productionDate: json["production_date"] == null ? null : DateTime.parse(json["production_date"]),
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    quantity: json["quantity"],
    isActive: json["is_active"],
    remainingQuantity: json["remaining_quantity"]??0,
    productId: json["product_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "unit_price": unitPrice,
    "batch_number": batchNumber,
    "purchasing_price": purchasingPrice,
    "production_date": "${productionDate!.year.toString().padLeft(4, '0')}-${productionDate!.month.toString().padLeft(2, '0')}-${productionDate!.day.toString().padLeft(2, '0')}",
    "expiry_date": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "quantity": quantity,
    "is_active": isActive,
    "remaining_quantity": remainingQuantity,
    "product_id": productId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product?.toJson(),
  };
}

class Product {
  final int? id;
  final String? name;
  final int? isActive;
  final int? productCategoryId;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic productCategory;

  Product({
    this.id,
    this.name,
    this.isActive,
    this.productCategoryId,
    this.image='',
    this.createdAt,
    this.updatedAt,
    this.productCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
    productCategoryId: json["product_category_id"],
    image: json["image"]??'',
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    productCategory: json["product_category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
    "product_category_id": productCategoryId,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product_category": productCategory,
  };
}


String text = "";
// List<Item> ITEM_LIST = [
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       price: 100,
//       favorite: 0,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       favorite: 0,
//       price: 100,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       price: 100,
//       favorite: 0,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       price: 100,
//       favorite: 0,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       price: 100,
//       favorite: 0,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       favorite: 0,
//       price: 100,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       favorite: 0,
//       price: 100,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
//   Item(
//       name: "شوكولاتة مليكا",
//       id: "شوكولاتة",
//       price: 100,
//       favorite: 0,
//       ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
//   ),
// ];