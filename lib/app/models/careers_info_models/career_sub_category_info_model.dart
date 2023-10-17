import 'dart:convert';

List<CareerSubCategoryInfoModel> careerSubCategoryInfoModelFromJson(
        String str) =>
    List<CareerSubCategoryInfoModel>.from(
        json.decode(str).map((x) => CareerSubCategoryInfoModel.fromJson(x)));

String careerSubCategoryInfoModelToJson(
        List<CareerSubCategoryInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CareerSubCategoryInfoModel {
  int id;
  int careerSubcategoryId;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  CareerSubCategoryInfoModel({
    required this.id,
    required this.careerSubcategoryId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CareerSubCategoryInfoModel.fromJson(Map<String, dynamic> json) =>
      CareerSubCategoryInfoModel(
        id: json["id"],
        careerSubcategoryId: json["career_subcategory_id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_subcategory_id": careerSubcategoryId,
        "title": title,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
