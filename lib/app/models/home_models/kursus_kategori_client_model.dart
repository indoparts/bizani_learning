class KursusKategoriClientModel {
  int id;
  String name;

  KursusKategoriClientModel({
    required this.id,
    required this.name,
  });

  factory KursusKategoriClientModel.fromJson(Map<String, dynamic> json) =>
      KursusKategoriClientModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
