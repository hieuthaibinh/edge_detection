import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuangCao {
  final String image;
  final String link;
  QuangCao({
    required this.image,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'link': link,
    };
  }

  factory QuangCao.fromMap(Map<String, dynamic> map) {
    return QuangCao(
      image: map['image'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuangCao.fromJson(String source) => QuangCao.fromMap(json.decode(source) as Map<String, dynamic>);
}
