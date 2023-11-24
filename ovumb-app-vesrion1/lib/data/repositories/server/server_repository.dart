import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_provider.dart';

class ServerRepository {
  final _provider = ServerProvider();

  Future updateNguoiDung({
    required String tenNguoiDung,
    required int canNang,
    required int chieuCao,
  }) =>
      _provider.updateNguoiDung(tenNguoiDung, canNang, chieuCao);

  Future updatePhase({
    required int phase,
  }) =>
      _provider.updatePhase(phase);

  Future getListKinhNguyet({
    required String maNguoiDung,
  }) =>
      _provider.getListKinhNguyet(maNguoiDung);

  Future updateKinhNguyet({
    required String maNguoiDung,
    required DateTime ngayBatDau,
  }) =>
      _provider.updateKinhNguyet(maNguoiDung, ngayBatDau);

  Future deleteListKinhNguyet({
    required String maNguoiDung,
  }) =>
      _provider.deleteListKinhNguyet(maNguoiDung);

  Future insertListKinhNguyet({
    required List<KinhNguyet> listKinhNguyet,
  }) =>
      _provider.insertListKinhNguyet(listKinhNguyet);

  Future syncKinhNguyetToServer({
    required String maNguoiDung,
    required List<KinhNguyet> listKinhNguyet,
  }) =>
      _provider.syncKinhNguyetToServer(maNguoiDung, listKinhNguyet);

  Future getListNhatKy({
    required String maNguoiDung,
  }) =>
      _provider.getListNhatKy(maNguoiDung);

  Future deteleNhatKy({
    required String maNguoiDung,
    required DateTime date,
  }) =>
      _provider.deteleNhatKy(maNguoiDung, date);

  Future getNhatKy({
    required String maNguoiDung,
    required DateTime date,
  }) =>
      _provider.getNhatKy(maNguoiDung, date);

  Future getListLuongKinh() => _provider.getListLuongKinh();
  Future insertLuongKinh({
    required LuongKinh luongKinh,
  }) =>
      _provider.insertLuongKinh(luongKinh);
  Future deleteLuongKinh({
    required DateTime date,
  }) =>
      _provider.deleteLuongKinh(date);

  Future insertListCauTraLoi({
    required DateTime date,
    required List<String> listCauTraLoi,
  }) =>
      _provider.insertListCauTraLoi(date, listCauTraLoi);

  Future getQuanLyQueTest() => _provider.getQuanLyQueTest();

  Future updateHopTest({
    required String maHopTest,
    required DateTime date,
  }) =>
      _provider.updateHopTest(maHopTest, date);

  Future insertKetQuaTest({
    required int maQuanLyQueTest,
    required int maLoaiQue,
    required DateTime date,
    required int ketQua,
    int? phase,
    int? testEnum,
    int? firstDate,
    int? endDate,
  }) =>
      _provider.insertKetQuaTest(maQuanLyQueTest, maLoaiQue, date, ketQua,
          phase, testEnum, firstDate, endDate);

  Future updateKetQuaTest({
    required int maKetQuaTest,
    required int ketQua,
  }) =>
      _provider.updateKetQuaTest(maKetQuaTest, ketQua);

  Future getKetQuaTest() => _provider.getKetQuaTest();

  Future getKetQuaTestBefore() => _provider.getKetQuaTestBefore();

  Future<bool?> getKetQuaTestDatDinh({
    required int maQuanLyQueTest,
    required DateTime begin,
    required DateTime end,
  }) =>
      _provider.getKetQuaTestDatDinh(maQuanLyQueTest, begin, end);

  Future getThaiKi({
    required String maNguoiDung,
  }) =>
      _provider.getThaiKi(maNguoiDung);

  Future insertThaiKi({
    required ThaiKi thaiKi,
  }) =>
      _provider.insertThaiKi(thaiKi);

  Future updateThaiKi({
    required ThaiKi thaiKi,
  }) =>
      _provider.updateThaiKi(thaiKi);

  Future getLink({required int maLink}) => _provider.getLink(maLink);

  Future getListBlogType({required int phase}) =>
      _provider.getListBlogType(phase);

  Future getListBlog({required int id}) => _provider.getListBlog(id);

  Future getAds({
    required int phase,
    required int type,
  }) =>
      _provider.getAds(phase, type);

  Future insertClick({
    required int maLink,
  }) =>
      _provider.insertClick(maLink);
}
// {} [] 