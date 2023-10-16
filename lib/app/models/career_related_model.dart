import 'dart:convert';

List<CareerRelatedModel> careerRelatedModelFromJson(String str) =>
    List<CareerRelatedModel>.from(
        json.decode(str).map((x) => CareerRelatedModel.fromJson(x)));

String careerRelatedModelToJson(List<CareerRelatedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CareerRelatedModel {
  int id;
  int careerCategoryId;
  int createdBy;
  String icon;
  String coverImg;
  String name;
  String slug;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeyword;
  String alternateName;
  String conclusion;
  String adviseFromWise;
  String didYouKnow;
  DateTime createdAt;
  DateTime updatedAt;

  CareerRelatedModel({
    required this.id,
    required this.careerCategoryId,
    required this.createdBy,
    required this.icon,
    required this.coverImg,
    required this.name,
    required this.slug,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.alternateName,
    required this.conclusion,
    required this.adviseFromWise,
    required this.didYouKnow,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CareerRelatedModel.fromJson(Map<String, dynamic> json) =>
      CareerRelatedModel(
        id: json["id"],
        careerCategoryId: json["career_category_id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        coverImg: json["cover_img"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        alternateName: json["alternate_name"],
        conclusion: json["conclusion"],
        adviseFromWise: json["advise_from_wise"],
        didYouKnow: json["did_you_know"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_category_id": careerCategoryId,
        "created_by": createdBy,
        "icon": icon,
        "cover_img": coverImg,
        "name": name,
        "slug": slug,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "alternate_name": alternateName,
        "conclusion": conclusion,
        "advise_from_wise": adviseFromWise,
        "did_you_know": didYouKnow,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
