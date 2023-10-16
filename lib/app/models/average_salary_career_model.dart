import 'dart:convert';

List<AverageSalaryCareerModel> averageSalaryCareerModelFromJson(String str) =>
    List<AverageSalaryCareerModel>.from(
        json.decode(str).map((x) => AverageSalaryCareerModel.fromJson(x)));

String averageSalaryCareerModelToJson(List<AverageSalaryCareerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AverageSalaryCareerModel {
  int id;
  int careerSubcategoryId;
  String countryName;
  String countryFlagImg;
  String countryCurrency;
  String countryAmountCurrency;
  DateTime countryAmountCurrencyPeriod;
  DateTime createdAt;
  DateTime updatedAt;

  AverageSalaryCareerModel({
    required this.id,
    required this.careerSubcategoryId,
    required this.countryName,
    required this.countryFlagImg,
    required this.countryCurrency,
    required this.countryAmountCurrency,
    required this.countryAmountCurrencyPeriod,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AverageSalaryCareerModel.fromJson(Map<String, dynamic> json) =>
      AverageSalaryCareerModel(
        id: json["id"],
        careerSubcategoryId: json["career_subcategory_id"],
        countryName: json["country_name"],
        countryFlagImg: json["country_flag_img"],
        countryCurrency: json["country_currency"],
        countryAmountCurrency: json["country_amount_currency"],
        countryAmountCurrencyPeriod:
            DateTime.parse(json["country_amount_currency_period"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_subcategory_id": careerSubcategoryId,
        "country_name": countryName,
        "country_flag_img": countryFlagImg,
        "country_currency": countryCurrency,
        "country_amount_currency": countryAmountCurrency,
        "country_amount_currency_period":
            countryAmountCurrencyPeriod.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
