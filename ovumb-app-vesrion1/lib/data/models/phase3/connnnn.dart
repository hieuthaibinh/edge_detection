import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Con {
  final int id;
  final String ten;
  final DateTime ngaySinh;
  final String gioiTinh;
  final int? trangThai;
  final DateTime? thoiGian;

  Con({
    required this.id,
    required this.ten,
    required this.ngaySinh,
    required this.gioiTinh,
    this.trangThai,
    this.thoiGian,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ten': ten,
      'ngaySinh': ngaySinh.millisecondsSinceEpoch,
      'gioiTinh': gioiTinh,
      'trangThai': trangThai,
      'thoiGian': thoiGian?.millisecondsSinceEpoch,
    };
  }

  factory Con.fromMap(Map<String, dynamic> map) {
    return Con(
      id: map['id'] as int,
      ten: map['ten'] as String,
      ngaySinh: DateTime.fromMillisecondsSinceEpoch(map['ngaySinh'] as int),
      gioiTinh: map['gioiTinh'] as String,
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
      thoiGian: map['thoiGian'] != null ? DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Con.fromJson(String source) =>
      Con.fromMap(json.decode(source) as Map<String, dynamic>);
}
