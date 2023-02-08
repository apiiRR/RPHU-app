import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        required this.id,
        required this.name,
        required this.uomId,
    });

    int id;
    String name;
    List<dynamic> uomId;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        uomId: List<dynamic>.from(json["uom_id"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "uom_id": List<dynamic>.from(uomId.map((x) => x)),
    };
}
