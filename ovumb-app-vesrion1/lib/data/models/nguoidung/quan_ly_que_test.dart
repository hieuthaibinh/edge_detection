import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuanLyQueTest {
  final int? maQuanLyQueTest;
  final int soLuongQueThai;
  final int soLuongQueTrung;
  final int tongQueThai;
  final int tongQueTrung;
  QuanLyQueTest({
    this.maQuanLyQueTest,
    required this.soLuongQueThai,
    required this.soLuongQueTrung,
    required this.tongQueThai,
    required this.tongQueTrung,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maQuanLyQueTest': maQuanLyQueTest,
      'soLuongQueThai': soLuongQueThai,
      'soLuongQueTrung': soLuongQueTrung,
      'tongQueThai': tongQueThai,
      'tongQueTrung': tongQueTrung,
    };
  }

  factory QuanLyQueTest.fromMap(Map<String, dynamic> map) {
    return QuanLyQueTest(
      maQuanLyQueTest:
          map['maQuanLyQueTest'] != null ? map['maQuanLyQueTest'] as int : null,
      soLuongQueThai: map['soLuongQueThai'] as int,
      soLuongQueTrung: map['soLuongQueTrung'] as int,
      tongQueThai: map['tongQueThai'] as int,
      tongQueTrung: map['tongQueTrung'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuanLyQueTest.fromJson(String source) =>
      QuanLyQueTest.fromMap(json.decode(source) as Map<String, dynamic>);
}
