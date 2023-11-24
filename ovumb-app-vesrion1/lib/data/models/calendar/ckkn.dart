// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// dữ liệu input
class CKKN {
  final int snck; // số ngày có kinh
  final int snct;
  final int tbnkn; // độ dài trung bình
  final List<DateTime> listOfDayCKKN; // danh sách các ngày trong ckkn

  CKKN({
    required this.snck,
    required this.snct,
    required this.tbnkn,
    required this.listOfDayCKKN,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snck': snck,
      'snct': snct,
      'tbnkn': tbnkn,
      'listOfDayCKKN':
          listOfDayCKKN.map((x) => x.millisecondsSinceEpoch).toList(),
    };
  }

  factory CKKN.fromMap(Map<String, dynamic> map) {
    return CKKN(
      snck: map['snck'] as int,
      snct: map['snct'] as int,
      tbnkn: map['tbnkn'] as int,
      listOfDayCKKN: List<DateTime>.from(
        (map['listOfDayCKKN'] as List<int>).map<DateTime>(
          (x) => DateTime.fromMillisecondsSinceEpoch(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CKKN.fromJson(String source) =>
      CKKN.fromMap(json.decode(source) as Map<String, dynamic>);
}
