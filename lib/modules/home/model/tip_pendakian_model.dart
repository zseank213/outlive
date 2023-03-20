// To parse this JSON data, do
//
//     final tipsPendakianModel = tipsPendakianModelFromJson(jsonString);

import 'dart:convert';

TipsPendakianModel tipsPendakianModelFromJson(String str) => TipsPendakianModel.fromJson(json.decode(str));

String tipsPendakianModelToJson(TipsPendakianModel data) => json.encode(data.toJson());

class TipsPendakianModel {
  TipsPendakianModel({
    this.data,
  });

  List<TipsPendakianModelDatum>? data;

  factory TipsPendakianModel.fromJson(Map<String, dynamic> json) => TipsPendakianModel(
        data: json["data"] == null ? [] : List<TipsPendakianModelDatum>.from(json["data"]!.map((x) => TipsPendakianModelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TipsPendakianModelDatum {
  TipsPendakianModelDatum({
    this.name,
    this.data,
    this.isActive,
  });

  String? name;
  List<DatumTipsPendakian>? data;
  bool? isActive;

  factory TipsPendakianModelDatum.fromJson(Map<String, dynamic> json) => TipsPendakianModelDatum(
        name: json["name"],
        data: json["data"] == null ? [] : List<DatumTipsPendakian>.from(json["data"]!.map((x) => DatumTipsPendakian.fromJson(x))),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "isActive": isActive as bool? ?? false,
      };
}

class DatumTipsPendakian {
  DatumTipsPendakian({
    this.image,
    this.title,
    this.subtitle,
  });

  String? image;
  String? title;
  String? subtitle;

  factory DatumTipsPendakian.fromJson(Map<String, dynamic> json) => DatumTipsPendakian(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
      };
}
