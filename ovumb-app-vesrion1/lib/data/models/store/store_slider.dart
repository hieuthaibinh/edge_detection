import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreSlider {
  final int id;
  final String title;
  final String image;
  StoreSlider({
    required this.id,
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory StoreSlider.fromMap(Map<String, dynamic> map) {
    return StoreSlider(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreSlider.fromJson(String source) => StoreSlider.fromMap(json.decode(source) as Map<String, dynamic>);
}
