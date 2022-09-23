import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) => List<CountriesModel>.from(json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  CountriesModel({
    required this.alpha3,
    required this.currencyId,
    required this.currencyName,
    required this.currencySymbol,
    required this.id,
    required this.name,
  });

  final String alpha3;
  final String currencyId;
  final String currencyName;
  final String currencySymbol;
  final String id;
  final String name;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    alpha3: json["alpha3"] == null ? '' : json["alpha3"],
    currencyId: json["currencyId"] == null ? '' : json["currencyId"],
    currencyName: json["currencyName"] == null ? '' : json["currencyName"],
    currencySymbol: json["currencySymbol"] == null ? '' : json["currencySymbol"],
    id: json["id"] == null ? '' : json["id"],
    name: json["name"] == null ? '' : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "alpha3": alpha3 == null ? '' : alpha3,
    "currencyId": currencyId == null ? '' : currencyId,
    "currencyName": currencyName == null ? '' : currencyName,
    "currencySymbol": currencySymbol == null ? '' : currencySymbol,
    "id": id == null ? '' : id,
    "name": name == null ? '' : name,
  };
}
