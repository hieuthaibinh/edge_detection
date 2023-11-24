import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreLocation {
  final String code;
  final String name;
  final String fullName;
  StoreLocation({
    required this.code,
    required this.name,
    required this.fullName,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'fullName': fullName,
    };
  }

  factory StoreLocation.fromMap(Map<String, dynamic> map) {
    return StoreLocation(
      code: map['code'] as String,
      name: map['name'] as String,
      fullName: map['full_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreLocation.fromJson(String source) => StoreLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
