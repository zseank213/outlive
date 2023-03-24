// To parse this JSON data, do
//
//     final quizStepTwoModel = quizStepTwoModelFromJson(jsonString);

import 'dart:convert';

QuizStepTwoModel quizStepTwoModelFromJson(String str) => QuizStepTwoModel.fromJson(json.decode(str));

String quizStepTwoModelToJson(QuizStepTwoModel data) => json.encode(data.toJson());

class QuizStepTwoModel {
  QuizStepTwoModel({
    this.data,
  });

  List<DatumQuizStepTwoModel>? data;

  factory QuizStepTwoModel.fromJson(Map<String, dynamic> json) => QuizStepTwoModel(
        data: json["data"] == null ? [] : List<DatumQuizStepTwoModel>.from(json["data"]!.map((x) => DatumQuizStepTwoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumQuizStepTwoModel {
  DatumQuizStepTwoModel({
    this.tittle,
    this.option,
  });

  String? tittle;
  List<Option>? option;

  factory DatumQuizStepTwoModel.fromJson(Map<String, dynamic> json) => DatumQuizStepTwoModel(
        tittle: json["tittle"],
        option: json["option"] == null ? [] : List<Option>.from(json["option"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "option": option == null ? [] : List<dynamic>.from(option!.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.data,
    this.isActive,
  });

  String? data;
  bool? isActive;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        data: json["data"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "isActive": isActive,
      };
}
