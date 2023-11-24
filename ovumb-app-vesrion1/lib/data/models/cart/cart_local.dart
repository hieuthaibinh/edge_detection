import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final int maSanPham;
  final String maNguoiDung;
  final int soLuong;
  final int trangThai;
  CartModel({
    required this.maSanPham,
    required this.maNguoiDung,
    required this.soLuong,
    required this.trangThai,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maSanPham': maSanPham,
      'maNguoiDung': maNguoiDung,
      'soLuong': soLuong,
      'trangThai': trangThai,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      maSanPham: map['maSanPham'] as int,
      maNguoiDung: map['maNguoiDung'] as String,
      soLuong: map['soLuong'] as int,
      trangThai: map['trangThai'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
