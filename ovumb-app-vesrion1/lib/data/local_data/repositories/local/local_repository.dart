import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_provider.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';

class LocalRepository {
  final localProvider = LocalProvider();

  //người dùng
  Future insertNguoiDung(NguoiDung nguoiDung) =>
      localProvider.insertNguoiDung(nguoiDung);

  Future<NguoiDung> getNguoiDung(String id) => localProvider.getNguoiDung(id);

  Future updateNguoiDung(NguoiDung nguoiDung) =>
      localProvider.updateNguoiDung(nguoiDung);

  Future updatePhase(
    int phase,
  ) =>
      localProvider.updatePhase(phase);


  Future getListKinhNguyet(String id) => localProvider.getListKinhNguyet(id);

  //get list câu hỏi
  Future<List<CauHoi>> getListCauHoi() => localProvider.getListCauHoi();
  //insert câu hỏi
  Future insertCauHoi({required List<CauHoi> listCauHoi}) =>
      localProvider.insertCauHoi(listCauHoi);

  //insert Nhật ký
  Future<int> insertNhatKy({
    required String id,
    required int date,
    required bool connected,
  }) =>
      localProvider.insertNhatKy(id, date, connected);

  Future updateNhatKy({
    required String id,
    required int date,
    required bool connected,
  }) =>
      localProvider.updateNhatKy(id, date, connected);


  //get list nhật ký chưa đồng bộ
  Future getListNhatKyNotSync({required String id}) =>
      localProvider.getListNhatKyNotSync(id);

  //get list nhật ký đã đồng bộ và đã bị xóa
  Future getListNhatKyDeleted({required String id}) =>
      localProvider.getListNhatKyDeleted(id);


  //get list câu trả lời
  Future getListCauTraLoi({
    required String id,
    required int date,
  }) =>
      localProvider.getListCauTraLoi(id, date);

  //update list câu trả lời
  Future updateListCauTraLoi({
    required String maNguoiDung,
    required int date,
    required List<String> listCauTraLoi,
    required bool connected,
  }) =>
      localProvider.updateListCauTraLoi(
          maNguoiDung, date, listCauTraLoi, connected);

  //insert list câu trả lời
  Future insertListCauTraLoi({
    required int maNhatKy,
    required List<String> listCauTraLoi,
    required bool connected,
  }) =>
      localProvider.insertListCauTraLoi(maNhatKy, listCauTraLoi, connected);


  // xóa tât cả dữ liệu khi đăng xuất
  Future deleteAll() => localProvider.deleteAll();

  Future insertThaiKi({
    required ThaiKi thaiKi,
  }) =>
      localProvider.insertThaiKi(thaiKi);

  Future getThaiKi({
    required String maNguoiDung,
  }) =>
      localProvider.getThaiKi(maNguoiDung);

  Future updateThaiKi({
    required ThaiKi thaiKi,
  }) =>
      localProvider.updateThaiKi(thaiKi);

  Future deleteThaiKi({
    required String maNguoiDung,
  }) =>
      localProvider.deleteThaiKi(maNguoiDung);

}
