import 'package:flutter_ovumb_app_version1/data/repositories/luongkinh/luongkinh_provider.dart';

class LuongKinhRepository {
  final localProvider = LuongKinhProvider();

  //get lượng kinh
  Future getLuongKinh({
    required String maNguoiDung,
    required DateTime date,
  }) =>
      localProvider.getLuongKinh(maNguoiDung, date);

  //delete lượng kinh
  Future deleteLuongKinh({
    required int maLuongKinh,
  }) =>
      localProvider.deleteLuongKinh(maLuongKinh);

  //delete hắn lượng kinh
  Future deleteLuongKinh1({
    required int maLuongKinh,
  }) =>
      localProvider.deleteLuongKinh1(maLuongKinh);

  //delete lượng kinh
  Future deleteListLuongKinh({
    required DateTime begin,
    required DateTime end,
  }) =>
      localProvider.deleteListLuongKinh(begin, end);

  //delete tất cả lượng kinh
  Future deleteLuongKinhByTime({
    required DateTime date,
  }) =>
      localProvider.deleteLuongKinhByTime(date);

  //get list lượng kinh
  Future getListLuongKinh({
    required String maNguoiDung,
    required int tonTai,
  }) =>
      localProvider.getListLuongKinh(maNguoiDung, tonTai);

  //get list lượng kinh
  Future getListLuongKinhSync({
    required String maNguoiDung,
  }) =>
      localProvider.getListLuongKinhSync(maNguoiDung);

  //get list lượng kinh
  Future getListLuongKinhFromTo({
    required DateTime begin,
    required DateTime end,
  }) =>
      localProvider.getListLuongKinhFromTo(begin, end);

  //insert lượng kinh
  Future insertLuongKinh({
    required String maNguoiDung,
    required DateTime date,
    required String luongKinh,
  }) =>
      localProvider.insertLuongKinh(maNguoiDung, date, luongKinh);

  //insert list lượng kinh
  Future insertListLuongKinh({
    required String maNguoiDung,
    required DateTime begin,
    required DateTime end,
    required String luongKinh,
  }) =>
      localProvider.insertListLuongKinh(maNguoiDung, begin, end, luongKinh);

  //update trạng thái lượng kinh
  Future updateTrangThaiLuongKinh({
    required int maLuongKinh,
    required int trangThai,
  }) =>
      localProvider.updateTrangThaiLuongKinh(maLuongKinh, trangThai);
}
