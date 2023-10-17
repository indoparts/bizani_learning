// To parse this JSON data, do
//
//     final karirClientKategoriModel = karirClientKategoriModelFromJson(jsonString);

import 'dart:convert';

List<KarirClientKategoriModel> karirClientKategoriModelFromJson(String str) =>
    List<KarirClientKategoriModel>.from(
        json.decode(str).map((x) => KarirClientKategoriModel.fromJson(x)));

String karirClientKategoriModelToJson(List<KarirClientKategoriModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KarirClientKategoriModel {
  int id;
  int clientId;
  int careerCategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Category> category;

  KarirClientKategoriModel({
    required this.id,
    required this.clientId,
    required this.careerCategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory KarirClientKategoriModel.fromJson(Map<String, dynamic> json) =>
      KarirClientKategoriModel(
        id: json["id"],
        clientId: json["client_id"],
        careerCategoryId: json["career_category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clientId,
        "career_category_id": careerCategoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  int createdBy;
  String icon;
  dynamic coverImg;
  String name;
  dynamic description;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeyword;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.createdBy,
    required this.icon,
    required this.coverImg,
    required this.name,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        coverImg: json["cover_img"],
        name: json["name"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "icon": icon,
        "cover_img": coverImg,
        "name": name,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
