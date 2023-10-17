import 'dart:convert';

List<SkillsCareerModel> skillsCareerModelFromJson(String str) =>
    List<SkillsCareerModel>.from(
        json.decode(str).map((x) => SkillsCareerModel.fromJson(x)));

String skillsCareerModelToJson(List<SkillsCareerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkillsCareerModel {
  int id;
  int careerSubcategoryId;
  int level;
  String skillname;
  DateTime createdAt;
  DateTime updatedAt;

  SkillsCareerModel({
    required this.id,
    required this.careerSubcategoryId,
    required this.level,
    required this.skillname,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SkillsCareerModel.fromJson(Map<String, dynamic> json) =>
      SkillsCareerModel(
        id: json["id"],
        careerSubcategoryId: json["career_subcategory_id"],
        level: json["level"],
        skillname: json["skillname"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_subcategory_id": careerSubcategoryId,
        "level": level,
        "skillname": skillname,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
