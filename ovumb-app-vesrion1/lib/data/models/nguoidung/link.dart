import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Link {
  final int maLink;
  final String tenLink;
  final String title;
  final String description;
  final String image;
  final int member;
  Link({
    required this.maLink,
    required this.tenLink,
    required this.title,
    required this.description,
    required this.image,
    required this.member,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maLink': maLink,
      'tenLink': tenLink,
      'title': title,
      'description': description,
      'image': image,
      'member': member,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      maLink: map['maLink'] as int,
      tenLink: map['tenLink'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      member: map['member'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) =>
      Link.fromMap(json.decode(source) as Map<String, dynamic>);
}
