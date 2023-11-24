import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HutSua {
  final int? id;
  final num? vuTrai;
  final num? vuPhai;
  final int lanChoAn;
  final DateTime? thoiGian;
  final DateTime? ngayTao;
  HutSua({
    this.id,
    this.vuTrai,
    this.vuPhai,
    required this.lanChoAn,
    this.thoiGian,
    this.ngayTao,
  });
 
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'vuTrai': vuTrai,
      'vuPhai': vuPhai,
      'lanChoAn': lanChoAn,
      'thoiGian': thoiGian?.millisecondsSinceEpoch,
      'ngayTao': ngayTao?.millisecondsSinceEpoch,
    };
  }

  factory HutSua.fromMap(Map<String, dynamic> map) {
    return HutSua(
      id: map['id'] != null ? map['id'] as int : null,
      vuTrai: map['vuTrai'] != null ? map['vuTrai'] as num : null,
      vuPhai: map['vuPhai'] != null ? map['vuPhai'] as num : null,
      lanChoAn: map['lanChoAn'] as int,
      thoiGian: map['thoiGian'] != null ? DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int) : null,
      ngayTao: map['ngayTao'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ngayTao'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HutSua.fromJson(String source) => HutSua.fromMap(json.decode(source) as Map<String, dynamic>);
}
