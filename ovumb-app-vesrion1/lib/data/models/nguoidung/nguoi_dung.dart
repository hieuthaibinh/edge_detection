// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NguoiDung {
  final String maNguoiDung;
  final int? maTvv;
  final String tenNguoiDung;
  final String? email;
  final int namSinh;
  final int? chieuCao;
  final int? canNang;
  final int? phase;
  final DateTime? ngayTao;
  final int? trangThai;
  NguoiDung({
    required this.maNguoiDung,
    this.maTvv,
    required this.tenNguoiDung,
    this.email,
    required this.namSinh,
    this.chieuCao,
    this.canNang,
    this.phase,
    this.ngayTao,
    this.trangThai,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maNguoiDung': maNguoiDung,
      'maTvv': maTvv,
      'tenNguoiDung': tenNguoiDung,
      'email': email,
      'namSinh': namSinh,
      'chieuCao': chieuCao,
      'canNang': canNang,
      'phase': phase,
      'ngayTao': ngayTao?.millisecondsSinceEpoch,
      'trangThai': trangThai,
    };
  }

  factory NguoiDung.fromMap(Map<String, dynamic> map) {
    return NguoiDung(
      maNguoiDung: map['maNguoiDung'] as String,
      maTvv: map['maTvv'] != null ? map['maTvv'] as int : null,
      tenNguoiDung: map['tenNguoiDung'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      namSinh: map['namSinh'] as int,
      chieuCao: map['chieuCao'] != null ? map['chieuCao'] as int : null,
      canNang: map['canNang'] != null ? map['canNang'] as int : null,
      phase: map['phase'] != null ? map['phase'] as int : null,
      ngayTao: map['ngayTao'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayTao'] as int) : null,
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NguoiDung.fromJson(String source) => NguoiDung.fromMap(json.decode(source) as Map<String, dynamic>);
}
