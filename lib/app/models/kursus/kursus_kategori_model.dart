import 'dart:convert';

List<KursusKategoriModel> kursusKategoriModelFromJson(String str) =>
    List<KursusKategoriModel>.from(
        json.decode(str).map((x) => KursusKategoriModel.fromJson(x)));

String kursusKategoriModelToJson(List<KursusKategoriModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KursusKategoriModel {
  int id;
  int createdBy;
  String icon;
  dynamic coverImage;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  KursusKategoriModel({
    required this.id,
    required this.createdBy,
    required this.icon,
    required this.coverImage,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KursusKategoriModel.fromJson(Map<String, dynamic> json) =>
      KursusKategoriModel(
        id: json["id"],
        createdBy: json["created_by"],
        icon: json["icon"],
        coverImage: json["cover_image"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "icon": icon,
        "cover_image": coverImage,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
