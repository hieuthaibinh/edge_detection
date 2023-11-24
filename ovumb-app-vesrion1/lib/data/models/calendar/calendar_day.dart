// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';

class CalendarDay {
  final List<DateTime> listKinh;
  final List<DateTime> listTrung;
  final List<DateTime> listAnToanTuongDoi;
  final List<DateTime> listAnToanTuyetDoi;
  final List<DateTime> listLH;
  final List<KetQuaTest> listKetQuaTest;
  final List<NhatKy> listNhatKy;
  final List<LuongKinh> listLuongKinh;
  final List<KinhNguyet> listKinhNguyet;
  final KinhNguyet currentKinhNguyet;
  final KinhNguyet futureKinhNguyet;
  CalendarDay({
    required this.listKinh,
    required this.listTrung,
    required this.listAnToanTuongDoi,
    required this.listAnToanTuyetDoi,
    required this.listLH,
    required this.listKetQuaTest,
    required this.listNhatKy,
    required this.listLuongKinh,
    required this.listKinhNguyet,
    required this.currentKinhNguyet,
    required this.futureKinhNguyet,
  });
}
