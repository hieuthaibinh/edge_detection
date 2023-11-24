// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KinhNguyet {
  final int? maKinhNguyet;
  final String? maNguoiDung;
  final int tbnkn;
  final int snck;
  final int snct;
  final int ckdn;
  final int cknn;
  final DateTime? ngayBatDau;
  final DateTime? ngayKetThuc;
  final DateTime? ngayBatDauKinh;
  final DateTime? ngayKetThucKinh;
  final DateTime? ngayBatDauTrung;
  final DateTime? ngayKetThucTrung;
  final int? trangThai;
  KinhNguyet({
    this.maKinhNguyet,
    this.maNguoiDung,
    required this.tbnkn,
    required this.snck,
    required this.snct,
    required this.ckdn,
    required this.cknn,
    this.ngayBatDau,
    this.ngayKetThuc,
    this.ngayBatDauKinh,
    this.ngayKetThucKinh,
    this.ngayBatDauTrung,
    this.ngayKetThucTrung,
    this.trangThai,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maKinhNguyet': maKinhNguyet,
      'maNguoiDung': maNguoiDung,
      'tbnkn': tbnkn,
      'snck': snck,
      'snct': snct,
      'ckdn': ckdn,
      'cknn': cknn,
      'ngayBatDau': ngayBatDau?.millisecondsSinceEpoch,
      'ngayKetThuc': ngayKetThuc?.millisecondsSinceEpoch,
      'ngayBatDauKinh': ngayBatDauKinh?.millisecondsSinceEpoch,
      'ngayKetThucKinh': ngayKetThucKinh?.millisecondsSinceEpoch,
      'ngayBatDauTrung': ngayBatDauTrung?.millisecondsSinceEpoch,
      'ngayKetThucTrung': ngayKetThucTrung?.millisecondsSinceEpoch,
      'trangThai': trangThai,
    };
  }

  factory KinhNguyet.fromMap(Map<String, dynamic> map) {
    return KinhNguyet(
      maKinhNguyet: map['maKinhNguyet'] != null ? map['maKinhNguyet'] as int : null,
      maNguoiDung: map['maNguoiDung'] != null ? map['maNguoiDung'] as String : null,
      tbnkn: map['tbnkn'] as int,
      snck: map['snck'] as int,
      snct: map['snct'] as int,
      ckdn: map['ckdn'] as int,
      cknn: map['cknn'] as int,
      ngayBatDau: map['ngayBatDau'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayBatDau'] as int) : null,
      ngayKetThuc: map['ngayKetThuc'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayKetThuc'] as int) : null,
      ngayBatDauKinh: map['ngayBatDauKinh'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayBatDauKinh'] as int) : null,
      ngayKetThucKinh: map['ngayKetThucKinh'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayKetThucKinh'] as int) : null,
      ngayBatDauTrung: map['ngayBatDauTrung'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayBatDauTrung'] as int) : null,
      ngayKetThucTrung: map['ngayKetThucTrung'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayKetThucTrung'] as int) : null,
      trangThai: map['trangThai'] != null ? map['trangThai'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KinhNguyet.fromJson(String source) => KinhNguyet.fromMap(json.decode(source) as Map<String, dynamic>);
}
