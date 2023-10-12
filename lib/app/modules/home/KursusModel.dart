import 'dart:convert';

List<KursusModel> kursusModelFromJson(String str) => List<KursusModel>.from(
    json.decode(str).map((x) => KursusModel.fromJson(x)));

String kursusModelToJson(List<KursusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KursusModel {
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
  Category category;
  List<Question> question;
  Category subcategory;

  KursusModel({
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
    required this.category,
    required this.question,
    required this.subcategory,
  });

  factory KursusModel.fromJson(Map<String, dynamic> json) => KursusModel(
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
        category: Category.fromJson(json["category"]),
        question: List<Question>.from(
            json["question"].map((x) => Question.fromJson(x))),
        subcategory: Category.fromJson(json["subcategory"]),
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
        "category": category.toJson(),
        "question": List<dynamic>.from(question.map((x) => x.toJson())),
        "subcategory": subcategory.toJson(),
      };
}

class Category {
  int id;
  int createdBy;
  String icon;
  String? coverImage;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int? learningCategoryId;

  Category({
    required this.id,
    required this.createdBy,
    required this.icon,
    required this.coverImage,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.learningCategoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        coverImage: json["cover_image"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        learningCategoryId: json["learning_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "icon": icon,
        "cover_image": coverImage,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "learning_category_id": learningCategoryId,
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
