// To parse this JSON data, do
//
//     final quizStepOneModel = quizStepOneModelFromJson(jsonString);

import 'dart:convert';
import 'package:Eiger/lib.dart';

QuizStepOneModel quizStepOneModelFromJson(String str) => QuizStepOneModel.fromJson(json.decode(str));

String quizStepOneModelToJson(QuizStepOneModel data) => json.encode(data.toJson());

class QuizStepOneModel {
  QuizStepOneModel({
    this.data,
  });

  DataQuizStepOneModel? data;

  factory QuizStepOneModel.fromJson(Map<String, dynamic> json) => QuizStepOneModel(
        data: json["data"] == null ? null : DataQuizStepOneModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class DataQuizStepOneModel {
  DataQuizStepOneModel({
    this.tittle,
    this.option,
  });

  String? tittle;
  List<Option>? option;

  factory DataQuizStepOneModel.fromJson(Map<String, dynamic> json) => DataQuizStepOneModel(
        tittle: json["tittle"],
        option: json["option"] == null ? [] : List<Option>.from(json["option"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "option": option == null ? [] : List<dynamic>.from(option!.map((x) => x.toJson())),
      };
}
