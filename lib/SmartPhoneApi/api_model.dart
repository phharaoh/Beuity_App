// To parse this JSON data, do
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  Category({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int? id;
  final String? title;
  final String? category;
  final double? price;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.category,
    this.price,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    category: json["category"]!,
    price: json["price"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "price": price,
    "thumbnail": thumbnail,
  };
}
