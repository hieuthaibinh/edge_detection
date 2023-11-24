import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TVV {
  final int maTvv;
  final String tenTvv;
  final String linkZalo;
  final String soDienThoai;
  final String linkAnh;
  final String kinhNghiem;
  final String gioiThieu;
  final num rating;
  final String linkFb;
  TVV({
    required this.maTvv,
    required this.tenTvv,
    required this.linkZalo,
    required this.soDienThoai,
    required this.linkAnh,
    required this.kinhNghiem,
    required this.gioiThieu,
    required this.rating,
    required this.linkFb,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maTvv': maTvv,
      'tenTvv': tenTvv,
      'linkZalo': linkZalo,
      'soDienThoai': soDienThoai,
      'linkAnh': linkAnh,
      'kinhNghiem': kinhNghiem,
      'gioiThieu': gioiThieu,
      'rating': rating,
      'linkFb': linkFb,
    };
  }

  factory TVV.fromMap(Map<String, dynamic> map) {
    return TVV(
      maTvv: map['maTvv'] as int,
      tenTvv: map['tenTvv'] as String,
      linkZalo: map['linkZalo'] as String,
      soDienThoai: map['soDienThoai'] as String,
      linkAnh: map['linkAnh'] as String,
      kinhNghiem: map['kinhnghiem'] as String,
      gioiThieu: map['gioithieu'] as String,
      rating: map['rating'] as num,
      linkFb: map['linkFb'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TVV.fromJson(String source) =>
      TVV.fromMap(json.decode(source) as Map<String, dynamic>);
}
