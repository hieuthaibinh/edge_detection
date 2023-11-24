import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KetQuaTest {
  final int maKetQuaTest;
  final int maLoaiQue;
  final int lanTest;
  final DateTime thoiGian;
  final int ketQua;
  KetQuaTest({
    required this.maKetQuaTest,
    required this.maLoaiQue,
    required this.lanTest,
    required this.thoiGian,
    required this.ketQua,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maKetQuaTest': maKetQuaTest,
      'maLoaiQue': maLoaiQue,
      'lanTest': lanTest,
      'thoiGian': thoiGian.millisecondsSinceEpoch,
      'ketQua': ketQua,
    };
  }

  factory KetQuaTest.fromMap(Map<String, dynamic> map) {
    return KetQuaTest(
      maKetQuaTest: map['maKetQuaTest'] as int,
      maLoaiQue: map['maLoaiQue'] as int,
      lanTest: map['lanTest'] as int,
      thoiGian: DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int),
      ketQua: map['ketQua'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory KetQuaTest.fromJson(String source) =>
      KetQuaTest.fromMap(json.decode(source) as Map<String, dynamic>);
}
