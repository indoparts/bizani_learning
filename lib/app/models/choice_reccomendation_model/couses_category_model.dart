class CousesCategoryModel {
  int id;
  int createdBy;
  String icon;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<CousesCategoryModel>? subcategory;
  int? learningCategoryId;

  CousesCategoryModel({
    required this.id,
    required this.createdBy,
    required this.icon,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.subcategory,
    this.learningCategoryId,
  });

  factory CousesCategoryModel.fromJson(Map<String, dynamic> json) =>
      CousesCategoryModel(
        id: json["id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategory: json["subcategory"] == null
            ? []
            : List<CousesCategoryModel>.from(json["subcategory"]!
                .map((x) => CousesCategoryModel.fromJson(x))),
        learningCategoryId: json["learning_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "icon": icon,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subcategory": subcategory == null
            ? []
            : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
        "learning_category_id": learningCategoryId,
      };
}
