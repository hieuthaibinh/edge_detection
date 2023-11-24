import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class NhatKy {
  final int maNhatKy;
  final String maNguoiDung;
  final DateTime thoiGian;
  final int? trangThai;
  final int tonTai;
  NhatKy({
    required this.maNhatKy,
    required this.maNguoiDung,
    required this.thoiGian,
    this.trangThai,
    required this.tonTai,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maNhatKy': maNhatKy,
      'maNguoiDung': maNguoiDung,
      'thoiGian': thoiGian.millisecondsSinceEpoch,
      'trangThai': trangThai,
      'tonTai': tonTai,
    };
  }

  factory NhatKy.fromMap(Map<String, dynamic> map) {
    return NhatKy(
      maNhatKy: map['maNhatKy'] as int,
      maNguoiDung: map['maNguoiDung'] as String,
      thoiGian: DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int),
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
      tonTai: map['tonTai'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NhatKy.fromJson(String source) => NhatKy.fromMap(json.decode(source) as Map<String, dynamic>);
}
