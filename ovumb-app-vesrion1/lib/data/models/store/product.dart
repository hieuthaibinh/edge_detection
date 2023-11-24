import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String name;
  final String image;
  final num price;
  final num? sale;
  final String description;
  final String content;
  final String guide;
  final int productId;
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.sale,
    required this.description,
    required this.content,
    required this.guide,
    required this.productId,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'sale': sale,
      'description': description,
      'content': content,
      'guide': guide,
      'productId': productId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      sale: map['sale'] != null ? map['sale'] as num : null,
      description: map['description'] as String,
      content: map['content'] as String,
      guide: map['guide'] as String,
      productId: map['product_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

