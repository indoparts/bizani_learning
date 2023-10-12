import 'dart:convert';

List<KursusMateriSliderClientModelThree>
    kursusMateriSliderClientModelThreeFromJson(String str) =>
        List<KursusMateriSliderClientModelThree>.from(json
            .decode(str)
            .map((x) => KursusMateriSliderClientModelThree.fromJson(x)));

String kursusMateriSliderClientModelThreeToJson(
        List<KursusMateriSliderClientModelThree> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KursusMateriSliderClientModelThree {
  int id;
  int learningCategoryId;
  int learningSubcategoryId;
  int createdBy;
  String coverImg;
  String title;
  String slug;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Question> question;

  KursusMateriSliderClientModelThree({
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
    required this.question,
  });

  factory KursusMateriSliderClientModelThree.fromJson(
          Map<String, dynamic> json) =>
      KursusMateriSliderClientModelThree(
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        question: List<Question>.from(
            json["question"].map((x) => Question.fromJson(x))),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "question": List<dynamic>.from(question.map((x) => x.toJson())),
      };
}

class Question {
  int id;
  int learningMaterialId;
  String pertanyaan;
  String jawabanA;
  String jawabanB;
  String jawabanC;
  String jawabanD;
  String kunciJawaban;
  DateTime createdAt;
  DateTime updatedAt;

  Question({
    required this.id,
    required this.learningMaterialId,
    required this.pertanyaan,
    required this.jawabanA,
    required this.jawabanB,
    required this.jawabanC,
    required this.jawabanD,
    required this.kunciJawaban,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        learningMaterialId: json["learning_material_id"],
        pertanyaan: json["pertanyaan"],
        jawabanA: json["jawaban_a"],
        jawabanB: json["jawaban_b"],
        jawabanC: json["jawaban_c"],
        jawabanD: json["jawaban_d"],
        kunciJawaban: json["kunci_jawaban"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "learning_material_id": learningMaterialId,
        "pertanyaan": pertanyaan,
        "jawaban_a": jawabanA,
        "jawaban_b": jawabanB,
        "jawaban_c": jawabanC,
        "jawaban_d": jawabanD,
        "kunci_jawaban": kunciJawaban,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
