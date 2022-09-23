import 'dart:convert';

List<CurrenciesModel> currenciesModelFromJson(String str) => List<CurrenciesModel>.from(json.decode(str).map((x) => CurrenciesModel.fromJson(x)));

String currenciesModelToJson(List<CurrenciesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrenciesModel {
  CurrenciesModel({
    required this.currencyName,
    required this.currencySymbol,
    required this.id,
  });

  final String currencyName;
  final String currencySymbol;
  final String id;

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) => CurrenciesModel(
    currencyName: json["currencyName"] == null ? '' : json["currencyName"],
    currencySymbol: json["currencySymbol"] == null ? '' : json["currencySymbol"],
    id: json["id"] == null ? '' : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "currencyName": currencyName == null ? '' : currencyName,
    "currencySymbol": currencySymbol == null ? '' : currencySymbol,
    "id": id == null ? '' : id,
  };
}
