import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocalProduct {
  final int maSanPham;
  int soLuong;
  int trangThai;
  LocalProduct({
    required this.maSanPham,
    required this.soLuong,
    required this.trangThai,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maSanPham': maSanPham,
      'soLuong': soLuong,
      'trangThai': trangThai,
    };
  }

  factory LocalProduct.fromMap(Map<String, dynamic> map) {
    return LocalProduct(
      maSanPham: map['maSanPham'] as int,
      soLuong: map['soLuong'] as int,
      trangThai: map['trangThai'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalProduct.fromJson(String source) =>
      LocalProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
