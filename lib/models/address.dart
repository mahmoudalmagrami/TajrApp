// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  final int id;
  final String address;
  final double latitude;
  final double longitude;

  Address({
    this.id=0,
    this.address='',
    this.latitude=0,
    this.longitude=0,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };
}
