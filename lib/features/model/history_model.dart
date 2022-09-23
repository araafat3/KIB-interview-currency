import 'dart:convert';

List<Map<String, num>> historyModelFromJson(String str) => List<Map<String, num>>.from(json.decode(str).map((x) => Map.from(x).map((k, v) => MapEntry<String, num>(k, v.toDouble()))));

String historyModelToJson(List<Map<String, num>> data) => json.encode(List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))));

class History {
  final String date;
  final num value;

  const History({required this.date,required this.value});
}