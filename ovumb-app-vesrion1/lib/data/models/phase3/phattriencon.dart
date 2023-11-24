import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhatTrienCon {
  final int? id;
  final int? maCon;
  final num? canNang;
  final num? chieuCao;
  final DateTime? thoiGian;
  PhatTrienCon({
    this.id,
    required this.maCon,
    this.canNang,
    this.chieuCao,
    this.thoiGian,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'maCon': maCon,
      'canNang': canNang,
      'chieuCao': chieuCao,
      'thoiGian': thoiGian?.millisecondsSinceEpoch,
    };
  }

  factory PhatTrienCon.fromMap(Map<String, dynamic> map) {
    return PhatTrienCon(
      id: map['id'] != null ? map['id'] as int : null,
      maCon: map['maCon'] != null ? map['maCon'] as int : null,
      canNang: map['canNang'] != null ? map['canNang'] as num : null,
      chieuCao: map['chieuCao'] != null ? map['chieuCao'] as num : null,
      thoiGian: map['thoiGian'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['thoiGian'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhatTrienCon.fromJson(String source) =>
      PhatTrienCon.fromMap(json.decode(source) as Map<String, dynamic>);
}
