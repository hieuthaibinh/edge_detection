import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/enum/test_result_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/test_lh.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';

class ThaiKiProvider {
  final Dio _dio = Dio();
  ServerRepository _serverRepository = ServerRepository();
  LocalRepository _localRepository = LocalRepository();
  TestLH _testLH = TestLH();

  // lấy tư vấn viên theo user
  Future<bool> deleteNgayDuSinh() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        '$thaiKiDelete/$maNguoiDung',
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertNgayDuSinh() async {
    try {
      List<KetQuaTest> listKQ = await _serverRepository.getKetQuaTest();
      DateTime? time;
      for (int i = listKQ.length - 1; i >= 0; i--) {
        if (_testLH.checkLH(listKQ[i].ketQua) == TestResultEnum.datdinh) {
          time = listKQ[i].thoiGian;
          break;
        }
      }
      //nếu chưa test trứng thì insert ngày hiện tại
      if (listKQ.isEmpty) {
        time = DateTime.now();
      } else {
        // nếu có rồi thì xem ngày cuối cùng đạt đỉnh là ngày nào, có thì insert không có thì insert ngày cuối cùng test
        if (time != null) {
          time = time.add(const Duration(days: 280));
        } else {
          time = listKQ.last.thoiGian.add(const Duration(days: 280));
        }
      }
      await _localRepository.insertThaiKi(
          thaiKi: ThaiKi(ngayDuSinh: time.add(const Duration(days: 280))));
      await _serverRepository.insertThaiKi(
          thaiKi: ThaiKi(ngayDuSinh: time.add(const Duration(days: 280))));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertThaiKi(ThaiKi thaiKi) async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
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
      return true;
    } catch (e) {
      return false;
    }
  }
}
