import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Guide {
  final int id;
  final String link_video;
  Guide({
    required this.id,
    required this.link_video,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link_video': link_video,
    };
  }

  factory Guide.fromMap(Map<String, dynamic> map) {
    return Guide(
      id: map['id'] as int,
      link_video: map['link_video'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Guide.fromJson(String source) => Guide.fromMap(json.decode(source) as Map<String, dynamic>);
}
