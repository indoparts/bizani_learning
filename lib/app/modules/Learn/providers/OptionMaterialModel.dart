// To parse this JSON data, do
//
//     final optionMaterialModel = optionMaterialModelFromJson(jsonString);

import 'dart:convert';

List<OptionMaterialModel> optionMaterialModelFromJson(String str) =>
    List<OptionMaterialModel>.from(
        json.decode(str).map((x) => OptionMaterialModel.fromJson(x)));

String optionMaterialModelToJson(List<OptionMaterialModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OptionMaterialModel {
  int id;
  String titlePage;

  OptionMaterialModel({
    required this.id,
    required this.titlePage,
  });

  factory OptionMaterialModel.fromJson(Map<String, dynamic> json) =>
      OptionMaterialModel(
        id: json["id"],
        titlePage: json["title_page"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_page": titlePage,
      };
}
