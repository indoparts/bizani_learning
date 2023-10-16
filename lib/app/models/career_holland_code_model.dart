// To parse this JSON data, do
//
//     final careerHollandCodeModel = careerHollandCodeModelFromJson(jsonString);

import 'dart:convert';

List<CareerHollandCodeModel> careerHollandCodeModelFromJson(String str) =>
    List<CareerHollandCodeModel>.from(
        json.decode(str).map((x) => CareerHollandCodeModel.fromJson(x)));

String careerHollandCodeModelToJson(List<CareerHollandCodeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CareerHollandCodeModel {
  int id;
  int careerSubcategoryId;
  String initial;
  String desc;
  DateTime createdAt;
  DateTime updatedAt;

  CareerHollandCodeModel({
    required this.id,
    required this.careerSubcategoryId,
    required this.initial,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CareerHollandCodeModel.fromJson(Map<String, dynamic> json) =>
      CareerHollandCodeModel(
        id: json["id"],
        careerSubcategoryId: json["career_subcategory_id"],
        initial: json["initial"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_subcategory_id": careerSubcategoryId,
        "initial": initial,
        "desc": desc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
