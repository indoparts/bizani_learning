class CareerCategoryModel {
  int id;
  int createdBy;
  String icon;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<CareerCategoryModel>? subcategory;
  int? careerCategoryId;

  CareerCategoryModel({
    required this.id,
    required this.createdBy,
    required this.icon,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.subcategory,
    this.careerCategoryId,
  });

  factory CareerCategoryModel.fromJson(Map<String, dynamic> json) =>
      CareerCategoryModel(
        id: json["id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategory: json["subcategory"] == null
            ? []
            : List<CareerCategoryModel>.from(json["subcategory"]!
                .map((x) => CareerCategoryModel.fromJson(x))),
        careerCategoryId: json["career_category_id"],
      );
}
