import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CauHoi {
  final int maCauHoi;
  final String noiDung;
  CauHoi({
    required this.maCauHoi,
    required this.noiDung,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maCauHoi': maCauHoi,
      'noiDung': noiDung,
    };
  }

  factory CauHoi.fromMap(Map<String, dynamic> map) {
    return CauHoi(
      maCauHoi: map['maCauHoi'] as int,
      noiDung: map['noiDung'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CauHoi.fromJson(String source) =>
      CauHoi.fromMap(json.decode(source) as Map<String, dynamic>);
}

CauHoi cauHoiLuongKinh = CauHoi(maCauHoi: 1, noiDung: 'Lượng kinh');

List<CauHoi> listCauHoi = [
  CauHoi(maCauHoi: 1, noiDung: 'Nhiệt độ cơ thể bạn (℃)'),
  CauHoi(maCauHoi: 2, noiDung: 'Bạn có quan hệ tình dục vào ngày hôm nay?'),
  CauHoi(maCauHoi: 3, noiDung: 'Cơ thể bạn có những triệu chứng lạ?'),
  CauHoi(maCauHoi: 4, noiDung: 'Khí hư của bạn có bất thường?'),
  CauHoi(maCauHoi: 5, noiDung: 'Bạn có dấu hiệu rụng trứng không?'),
  CauHoi(maCauHoi: 6, noiDung: 'Dịch nhầy tử cung của bạn như thế nào?'),
  CauHoi(maCauHoi: 7, noiDung: 'Tâm trạng hôm nay của bạn thế nào?'),
  CauHoi(maCauHoi: 8, noiDung: 'Bạn có uống thuốc ngày hôm nay?'),
];
