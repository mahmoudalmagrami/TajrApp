// To parse this JSON data, do
//
//     final appUser = appUserFromJson(jsonString);

import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  final int id;
  final String username;
  final String email;
  final String phoneNumber;
   String status,token;

  AppUser({
    this.id=0,
    this.username='',
    this.email='',
    this.phoneNumber='',
    this.status='',this.token='',
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    status: json["status"],
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone_number": phoneNumber,
    "status": status,
    "token": token,

  };
}
