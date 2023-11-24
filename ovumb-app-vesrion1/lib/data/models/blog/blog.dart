import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  final int id;
  final String image;
  final String title;
  final String content;
  final String link;
  final DateTime date;
  final int type_blog_id;
  Blog({
    required this.id,
    required this.image,
    required this.title,
    required this.content,
    required this.link,
    required this.date,
    required this.type_blog_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'title': title,
      'content': content,
      'link': link,
      'date': date.millisecondsSinceEpoch,
      'type_blog_id': type_blog_id,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] as int,
      image: map['image'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      link: map['link'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type_blog_id: map['type_blog_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source) as Map<String, dynamic>);
}
