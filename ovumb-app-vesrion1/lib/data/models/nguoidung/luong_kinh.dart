import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LuongKinh {
  final int maLuongKinh;
  final String luongKinh;
  final DateTime thoiGian;
  final int? trangThai;
  final int tonTai;
  LuongKinh({
    required this.maLuongKinh,
    required this.luongKinh,
    required this.thoiGian,
    this.trangThai,
    required this.tonTai,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maLuongKinh': maLuongKinh,
      'luongKinh': luongKinh,
      'thoiGian': thoiGian.millisecondsSinceEpoch,
      'trangThai': trangThai,
      'tonTai': tonTai,
    };
  }

  factory LuongKinh.fromMap(Map<String, dynamic> map) {
    return LuongKinh(
      maLuongKinh: map['maLuongKinh'] as int,
      luongKinh: map['luongKinh'] as String,
      thoiGian: DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int),
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
      tonTai: map['tonTai'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LuongKinh.fromJson(String source) => LuongKinh.fromMap(json.decode(source) as Map<String, dynamic>);
}
