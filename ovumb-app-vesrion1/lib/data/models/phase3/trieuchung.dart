import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TrieuChung {
  final int id;
  final String? dauHieu;
  final String? noiDung;
  final String? capDo;
  final int? id_con;
  TrieuChung({
    required this.id,
    this.dauHieu,
    this.noiDung,
    this.capDo,
    this.id_con,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dauHieu': dauHieu,
      'noiDung': noiDung,
      'capDo': capDo,
      'id_con': id_con,
    };
  }

  factory TrieuChung.fromMap(Map<String, dynamic> map) {
    return TrieuChung(
      id: map['id'] as int,
      dauHieu: map['dauHieu'] != null ? map['dauHieu'] as String : null,
      noiDung: map['noiDung'] != null ? map['noiDung'] as String : null,
      capDo: map['capDo'] != null ? map['capDo'] as String : null,
      id_con: map['id_con'] != null ? map['id_con'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrieuChung.fromJson(String source) => TrieuChung.fromMap(json.decode(source) as Map<String, dynamic>);
}
