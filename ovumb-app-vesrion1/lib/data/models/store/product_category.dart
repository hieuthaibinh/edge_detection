import 'dart:convert';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCategory {
  final int id;
  final String name;
  final List<Product> products;
  ProductCategory({
    required this.id,
    required this.name,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      id: map['maloaisanpham'] as int,
      name: map['tenloaisanpham'] as String,
      products: (map['data'] as List<dynamic>?)
              ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) =>
      ProductCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
