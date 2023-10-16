import 'dart:convert';

List<CareerCoursesModel> careerCoursesModelFromJson(String str) =>
    List<CareerCoursesModel>.from(
        json.decode(str).map((x) => CareerCoursesModel.fromJson(x)));

String careerCoursesModelToJson(List<CareerCoursesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CareerCoursesModel {
  int id;
  int learningMaterialId;
  int careerSubcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  Courses courses;

  CareerCoursesModel({
    required this.id,
    required this.learningMaterialId,
    required this.careerSubcategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.courses,
  });

  factory CareerCoursesModel.fromJson(Map<String, dynamic> json) =>
      CareerCoursesModel(
        id: json["id"],
        learningMaterialId: json["learning_material_id"],
        careerSubcategoryId: json["career_subcategory_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        courses: Courses.fromJson(json["courses"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "learning_material_id": learningMaterialId,
        "career_subcategory_id": careerSubcategoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "courses": courses.toJson(),
      };
}

class Courses {
  int id;
  int learningCategoryId;
  int learningSubcategoryId;
  int createdBy;
  String coverImg;
  String title;
  String slug;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeyword;
  DateTime createdAt;
  DateTime updatedAt;

  Courses({
    required this.id,
    required this.learningCategoryId,
    required this.learningSubcategoryId,
    required this.createdBy,
    required this.coverImg,
    required this.title,
    required this.slug,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        id: json["id"],
        learningCategoryId: json["learning_category_id"],
        learningSubcategoryId: json["learning_subcategory_id"],
        createdBy: json["created_by"],
        coverImg: json["cover_img"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "learning_category_id": learningCategoryId,
        "learning_subcategory_id": learningSubcategoryId,
        "created_by": createdBy,
        "cover_img": coverImg,
        "title": title,
        "slug": slug,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
