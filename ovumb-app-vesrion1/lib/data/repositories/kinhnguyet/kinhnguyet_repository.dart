import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_provider.dart';

class KinhNguyetRepository {
  final localProvider = KinhNguyetProvider();

  Future getCalendarDay(String id) => localProvider.getCalendarDay(id);

  //insert kinh nguyệt
  Future insertKinhNguyet({
    required KinhNguyet kinhNguyet,
  }) =>
      localProvider.insertKinhNguyet(kinhNguyet);

  //get kinh nguyệt
  Future getKinhNguyet({
    required int trangThai,
  }) =>
      localProvider.getKinhNguyet(trangThai);

  //insert list kinh nguyệt
  Future insertListKinhNguyet({
    required List<KinhNguyet> listKinhNguyet,
    required String maNguoiDung,
    String? luongKinh,
    bool? isSync,
  }) =>
      localProvider.insertListKinhNguyet(
        maNguoiDung,
        listKinhNguyet,
        luongKinh,
        isSync,
      );

  Future<bool> updateTBNKN({
    required int tbnkn,
    required int snck,
  }) =>
      localProvider.updateTBNKN(tbnkn, snck);

  Future<bool> updateTrangThaiKNCurrent({
    required String maNguoiDung,
  }) =>
      localProvider.updateTrangThaiKNCurrent(maNguoiDung);

  Future<bool> deleteKinhNguyetByTime({
    required DateTime date,
  }) =>
      localProvider.deleteKinhNguyetByTime(date);

  Future<bool> updateCKKN({
    required String maNguoiDung,
    required DateTime date,
    required String luongKinh,
    required List<KinhNguyet> listKinhNguyet,
    required List<List<DateTime>> listLuongKinh,
  }) =>
      localProvider.updateCKKN(
          maNguoiDung, date, luongKinh, listKinhNguyet, listLuongKinh);

  Future<bool> deteleCKKN({
    required String maNguoiDung,
    required int maLuongKinh,
    required DateTime date,
    required List<KinhNguyet> listKinhNguyet,
    required List<List<DateTime>> listLuongKinh,
  }) =>
      localProvider.deteleCKKN(
          maNguoiDung, maLuongKinh, date, listKinhNguyet, listLuongKinh);

  Future<int> resetCKKNAfterTest({
    required int tbnknNew,
  }) =>
      localProvider.resetCKKNAfterTest(tbnknNew);

  Stream<CalendarDay> allListKN() => localProvider.allListKN();
}
