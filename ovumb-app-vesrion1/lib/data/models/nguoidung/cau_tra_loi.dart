import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CauTraLoi {
  final int maCauTraLoi;
  final int maNhatKy;
  final int maCauHoi;
  final String? cauTraLoi;
  CauTraLoi({
    required this.maCauTraLoi,
    required this.maNhatKy,
    required this.maCauHoi,
    this.cauTraLoi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maCauTraLoi': maCauTraLoi,
      'maNhatKy': maNhatKy,
      'maCauHoi': maCauHoi,
      'cauTraLoi': cauTraLoi,
    };
  }

  factory CauTraLoi.fromMap(Map<String, dynamic> map) {
    return CauTraLoi(
      maCauTraLoi: map['maCauTraLoi'] as int,
      maNhatKy: map['maNhatKy'] as int,
      maCauHoi: map['maCauHoi'] as int,
      cauTraLoi: map['cauTraLoi'] != null ? map['cauTraLoi'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CauTraLoi.fromJson(String source) => CauTraLoi.fromMap(json.decode(source) as Map<String, dynamic>);
}
