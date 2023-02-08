import 'dart:convert';

AddOrder addOrderFromJson(String str) => AddOrder.fromJson(json.decode(str));

String addOrderToJson(AddOrder data) => json.encode(data.toJson());

class AddOrder {
  AddOrder({
    required this.description,
    required this.date,
    required this.fromIds,
    required this.toIds,
    required this.byproductIds,
  });

  String description;
  String date;
  List<List<dynamic>> fromIds;
  List<List<dynamic>> toIds;
  List<List<dynamic>> byproductIds;

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
        description: json["description"],
        date: json["date"],
        fromIds: List<List<dynamic>>.from(
            json["from_ids"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        toIds: List<List<dynamic>>.from(
            json["to_ids"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        byproductIds: List<List<dynamic>>.from(json["byproduct_ids"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "date": date,
        "from_ids": List<dynamic>.from(
            fromIds.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "to_ids": List<dynamic>.from(
            toIds.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "byproduct_ids": List<dynamic>.from(
            byproductIds.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
