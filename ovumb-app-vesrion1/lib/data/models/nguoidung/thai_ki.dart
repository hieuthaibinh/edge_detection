import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThaiKi {
  final int? maThaiKi;
  final String? maNguoiDung;
  final DateTime? ngayQuanHe;
  final DateTime? ngayDuSinh;
  final DateTime? ngayTestThuThai;
  final int? ketQuaVangDa;
  final int? trangThai;
  ThaiKi({
    this.maThaiKi,
    this.maNguoiDung,
    this.ngayQuanHe,
    this.ngayDuSinh,
    this.ngayTestThuThai,
    this.ketQuaVangDa,
    this.trangThai,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maThaiKi': maThaiKi,
      'maNguoiDung': maNguoiDung,
      'ngayQuanHe': ngayQuanHe?.millisecondsSinceEpoch,
      'ngayDuSinh': ngayDuSinh?.millisecondsSinceEpoch,
      'ngayTestThuThai': ngayTestThuThai?.millisecondsSinceEpoch,
      'ketQuaVangDa': ketQuaVangDa,
      'trangThai': trangThai,
    };
  }

  factory ThaiKi.fromMap(Map<String, dynamic> map) {
    return ThaiKi(
      maThaiKi: map['maThaiKi'] != null ? map['maThaiKi'] as int : null,
      maNguoiDung: map['maNguoiDung'] != null ? map['maNguoiDung'] as String : null,
      ngayQuanHe: map['ngayQuanHe'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayQuanHe'] as int) : null,
      ngayDuSinh: map['ngayDuSinh'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayDuSinh'] as int) : null,
      ngayTestThuThai: map['ngayTestThuThai'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayTestThuThai'] as int) : null,
      ketQuaVangDa: map['ketQuaVangDa'] != null ? map['ketQuaVangDa'] as int : null,
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThaiKi.fromJson(String source) =>
      ThaiKi.fromMap(json.decode(source) as Map<String, dynamic>);
}
