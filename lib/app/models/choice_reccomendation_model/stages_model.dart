// To parse this JSON data, do
//
//     final stagesModel = stagesModelFromJson(jsonString);

import 'dart:convert';

List<StagesModel> stagesModelFromJson(String str) => List<StagesModel>.from(
    json.decode(str).map((x) => StagesModel.fromJson(x)));

String stagesModelToJson(List<StagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StagesModel {
  String txt;
  String img;

  StagesModel({
    required this.txt,
    required this.img,
  });

  factory StagesModel.fromJson(Map<String, dynamic> json) => StagesModel(
        txt: json["txt"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "txt": txt,
        "img": img,
      };
}
