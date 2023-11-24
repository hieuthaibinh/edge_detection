import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_tra_loi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/ketquatest/ketquatest_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nguoidung/nguoidung_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nhatky/nhatky_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';

class SynchronizedProvider {
  final Dio _dio = Dio();
  LocalRepository _localRepository = LocalRepository();
  ServerRepository _serverRepository = ServerRepository();
  NhatKyRepository _nhatKyRepository = NhatKyRepository();
  KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
  KetQuaTestRepository _ketQuaTestRepository = KetQuaTestRepository();
  NguoiDungRepository _nguoiDungRepository = NguoiDungRepository();

  Future<void> syncAll(bool connected) async {
    int? check = await _nguoiDungRepository.getTrangThai();
    if (connected) {
      if (check == null || check == 0) {
        bool sync1 = await syncKinhNguyet();
        bool sync2 = await syncNhatKyToServer();
        bool sync3 = await syncNhatKyDeleteToServer();
        bool sync4 = await syncLuongKinhToServer();
        bool sync5 = await syncLuongKinhDeleteToServer();
        if (sync1 && sync2 && sync3 && sync4 && sync5) {
          await _nguoiDungRepository.updateTrangThai(trangThai: 1);
        }
      }
    }
  }

  Future<void> syncTrangThai() async {
    String maNguoiDung = await SharedPreferencesService.getId() ?? '';
    // cập nhật trạng thái khi kinh nguyệt hiện tại đã qua
    final check = await _kinhNguyetRepository.updateTrangThaiKNCurrent(
      maNguoiDung: maNguoiDung,
    );
    if (check) {
      await _nguoiDungRepository.updateTrangThai(trangThai: 0);
    }
  }

  // đồng bộ kinh nguyệt khi có mạng
  Future<bool> syncKinhNguyet() async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      List<KinhNguyet> localKinhNguyet =
          await _localRepository.getListKinhNguyet(maNguoiDung);
      bool check = await _serverRepository.syncKinhNguyetToServer(
        maNguoiDung: maNguoiDung,
        listKinhNguyet: localKinhNguyet,
      );
      return check;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ nhật ký khi có mạng
  Future<bool> syncNhatKyToServer() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      // lấy ra nhật ký chưa được đồng bộ vào server
      List<NhatKy> listNhatKy =
          await _localRepository.getListNhatKyNotSync(id: maNguoiDung);
      listNhatKy.forEach((nhatky) async {
        //lấy ra câu trả lời insert vào server
        List<CauTraLoi> listCauTraLoi = await _localRepository.getListCauTraLoi(
          id: nhatky.maNguoiDung,
          date: nhatky.thoiGian.millisecondsSinceEpoch,
        );
        List<String> listString =
            listCauTraLoi.map((e) => e.cauTraLoi.toString()).toList();
        final check = await _serverRepository.insertListCauTraLoi(
          date: nhatky.thoiGian,
          listCauTraLoi: listString,
        );
        if (check) {
          await _localRepository.updateNhatKy(
            id: nhatky.maNguoiDung,
            date: nhatky.thoiGian.millisecondsSinceEpoch,
            connected: true,
          );
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ nhật ký đã xóa khi có mạng
  Future<bool> syncNhatKyDeleteToServer() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      // lấy ra nhật ký chưa được đồng bộ vào server
      List<NhatKy> listNhatKy =
          await _localRepository.getListNhatKyDeleted(id: maNguoiDung);
      listNhatKy.forEach((e) async {
        await _serverRepository.deteleNhatKy(
          maNguoiDung: maNguoiDung,
          date: e.thoiGian,
        );
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ lượng kinh vào local
  Future<bool> syncLuongKinhToLocal() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<LuongKinh> res = await _serverRepository.getListLuongKinh();
      res.forEach((e) async {
        await _nhatKyRepository.insertLuongKinh(
          maNguoiDung: maNguoiDung,
          date: e.thoiGian,
          luongKinh: e.luongKinh,
        );
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ cập nhật lượng kinh vào server
  Future<bool> syncLuongKinhToServer() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<LuongKinh> listLuongKinh = await _nhatKyRepository
          .getListLuongKinhSync(maNguoiDung: maNguoiDung);
      if (listLuongKinh.isNotEmpty) {
        for (int i = 0; i < listLuongKinh.length; i++) {
          final check = await _serverRepository.insertLuongKinh(
              luongKinh: listLuongKinh[i]);
          if (check) {
            await _nhatKyRepository.updateTrangThaiLuongKinh(
              maLuongKinh: listLuongKinh[i].maLuongKinh,
              trangThai: 1,
            );
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ lượng kinh đã xóa vào server
  Future<bool> syncLuongKinhDeleteToServer() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<LuongKinh> listLuongKinh = await _nhatKyRepository.getListLuongKinh(
        maNguoiDung: maNguoiDung,
        tonTai: 1,
      );

      if (listLuongKinh.isNotEmpty) {
        for (int i = 0; i < listLuongKinh.length; i++) {
          final check = await _serverRepository.deleteLuongKinh(
              date: listLuongKinh[i].thoiGian);
          if (check) {
            await _nhatKyRepository.deleteLuongKinh1(
                maLuongKinh: listLuongKinh[i].maLuongKinh);
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ nhật ký và câu trả lời vào local
  Future<void> syncNhatKyToLocal() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get('$nhatKyFind/$maNguoiDung');
      if (response.statusCode == 200) {
        List list = response.data['data'];
        for (var nhatKy in list) {
          int maNhatKy = await _localRepository.insertNhatKy(
            id: maNguoiDung,
            date: nhatKy['thoiGian'],
            connected: true,
          );
          List<dynamic> listCauTraLoi = nhatKy['cauTraLoi'] as List<dynamic>;
          List<String> stringList =
              listCauTraLoi.map((item) => item.toString()).toList();
          await _localRepository.insertListCauTraLoi(
            maNhatKy: maNhatKy,
            listCauTraLoi: stringList,
            connected: true,
          );
        }
      }
    } catch (e) {}
  }

  // đồng bộ thai ki local
  Future<void> syncThaiKiToLocal() async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      ThaiKi? thaiKi =
          await _serverRepository.getThaiKi(maNguoiDung: maNguoiDung);
      if (thaiKi != null) {
        await _localRepository.insertThaiKi(
          thaiKi: ThaiKi(
            maNguoiDung: maNguoiDung,
            ngayDuSinh: thaiKi.ngayDuSinh,
          ),
        );
      }
    } catch (e) {}
  }

  // đồng bộ thai ki vao server local
  Future<bool> syncThaiKiToServer() async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      ThaiKi? thaiKi =
          await _localRepository.getThaiKi(maNguoiDung: maNguoiDung);
      if (thaiKi != null) {
        if (thaiKi.trangThai != 1) {
          ThaiKi? thaiKiServer =
              await _serverRepository.getThaiKi(maNguoiDung: maNguoiDung);
          //nếu đã tồn tại trên server thì update không thì insert
          if (thaiKiServer == null) {
            final check = await _serverRepository.insertThaiKi(thaiKi: thaiKi);
            if (check) {
              await _localRepository.updateThaiKi(
                thaiKi: ThaiKi(
                  maNguoiDung: thaiKi.maNguoiDung,
                  ngayDuSinh: thaiKi.ngayDuSinh,
                  trangThai: 1,
                ),
              );
            }
          } else {
            final check = await _serverRepository.updateThaiKi(thaiKi: thaiKi);
            if (check) {
              await _localRepository.updateThaiKi(
                thaiKi: ThaiKi(
                  maNguoiDung: thaiKi.maNguoiDung,
                  ngayDuSinh: thaiKi.ngayDuSinh,
                  trangThai: 1,
                ),
              );
            }
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //đồng bộ kết quả test
  Future<void> syncKetQuaTestToLocal() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<KetQuaTest> res = await _serverRepository.getKetQuaTest();
      if (res.isNotEmpty) {
        await _ketQuaTestRepository.insertListKetQuaTest(
            listKetQuaTest: res.reversed.toList());
      }
    } catch (e) {}
  }
}
