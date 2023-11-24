import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductType {
  final int id;
  final String? name;
  ProductType({
    required this.id,
    this.name,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ProductType.fromMap(Map<String, dynamic> map) {
    return ProductType(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductType.fromJson(String source) => ProductType.fromMap(json.decode(source) as Map<String, dynamic>);
}
