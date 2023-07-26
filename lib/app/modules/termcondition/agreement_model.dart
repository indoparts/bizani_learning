class Agreement {
  int id;
  int createdBy;
  String title;
  String content;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Agreement({
    required this.id,
    required this.createdBy,
    required this.title,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
        id: json["id"],
        createdBy: json["created_by"],
        title: json["title"],
        content: json["content"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "title": title,
        "content": content,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
