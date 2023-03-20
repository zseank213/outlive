// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';
import 'package:Eiger/lib.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.meta,
    this.data,
  });

  Meta? meta;
  LoginData? data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta == null ? null : meta?.toJson(),
        "data": data == null ? null : data?.toJson(),
      };
}

class LoginData {
  LoginData({
    this.token,
    this.emailIsVerified,
  });

  String? token;
  bool? emailIsVerified;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"] == null ? null : json["token"],
        emailIsVerified: json["email_is_verified"] == null ? null : json["email_is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "email_is_verified": emailIsVerified == null ? null : emailIsVerified,
      };
}
