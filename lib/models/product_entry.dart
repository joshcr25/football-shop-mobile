// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    Category category;
    String thumbnail;
    int quantity;
    String brand;
    int yearOfManufacture;
    int yearOfProduct;
    bool isFeatured;
    int? userId;
    String? userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.quantity,
        required this.brand,
        required this.yearOfManufacture,
        required this.yearOfProduct,
        required this.isFeatured,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        thumbnail: json["thumbnail"],
        quantity: json["quantity"],
        brand: json["brand"],
        yearOfManufacture: json["year_of_manufacture"],
        yearOfProduct: json["year_of_product"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "thumbnail": thumbnail,
        "quantity": quantity,
        "brand": brand,
        "year_of_manufacture": yearOfManufacture,
        "year_of_product": yearOfProduct,
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": userUsername,
    };
}

enum Category {
    bola,
    jersey
}

final categoryValues = EnumValues({
    "bola": Category.bola,
    "jersey": Category.jersey
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
