import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChoAn {
  final int? maChoAn;
  final int maLoaiChoAn;
  final int maCon;
  final num trongLuong;
  final int lanChoAn;
  final DateTime? thoiGian;
  final String? loaiThucPham;
  final int? vuTrai;
  final int? vuPhai;
  final String? tenLoaiChoAn;
  final String? donVi;
  final DateTime? ngayTao;

  ChoAn({
    this.maChoAn,
    required this.maLoaiChoAn,
    required this.maCon,
    required this.trongLuong,
    required this.lanChoAn,
    this.thoiGian,
    this.loaiThucPham,
    this.vuTrai,
    this.vuPhai,
    this.tenLoaiChoAn,
    this.donVi,
    this.ngayTao,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maChoAn': maChoAn,
      'maLoaiChoAn': maLoaiChoAn,
      'maCon': maCon,
      'trongLuong': trongLuong,
      'lanChoAn': lanChoAn,
      'thoiGian': thoiGian?.millisecondsSinceEpoch,
      'loaiThucPham': loaiThucPham,
      'vuTrai': vuTrai,
      'vuPhai': vuPhai,
      'tenLoaiChoAn': tenLoaiChoAn,
      'donVi': donVi,
      'ngayTao': ngayTao?.millisecondsSinceEpoch,
    };
  }

  factory ChoAn.fromMap(Map<String, dynamic> map) {
    return ChoAn(
      maChoAn: map['maChoAn'] != null ? map['maChoAn'] as int : null,
      maLoaiChoAn: map['maLoaiChoAn'] as int,
      maCon: map['maCon'] as int,
      trongLuong: map['trongLuong'] as num,
      lanChoAn: map['lanChoAn'] as int,
      thoiGian: map['thoiGian'] != null ? DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int) : null,
      loaiThucPham: map['loaiThucPham'] != null ? map['loaiThucPham'] as String : null,
      vuTrai: map['vuTrai'] != null ? map['vuTrai'] as int : null,
      vuPhai: map['vuPhai'] != null ? map['vuPhai'] as int : null,
      tenLoaiChoAn: map['tenLoaiChoAn'] != null ? map['tenLoaiChoAn'] as String : null,
      donVi: map['donVi'] != null ? map['donVi'] as String : null,
      ngayTao: map['ngayTao'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayTao'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChoAn.fromJson(String source) => ChoAn.fromMap(json.decode(source) as Map<String, dynamic>);
}
