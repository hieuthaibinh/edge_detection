import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/type_blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quan_ly_que_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quang_cao.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';

class ServerProvider {
  final Dio _dio = Dio();

  // update người dùng
  Future<bool> updateNguoiDung(
    String tenNguoiDung,
    int canNang,
    int chieuCao,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$authUpdateUser/$maNguoiDung',
        data: {
          'tenNguoiDung': tenNguoiDung,
          'canNang': canNang,
          'chieuCao': chieuCao,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // update người dùng
  Future<bool> updatePhase(
    int phase,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$authUpdatePhase/$maNguoiDung',
        data: {
          'phase': phase,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // update kinh nguyệt
  Future<bool> updateKinhNguyet(
    String maNguoiDung,
    DateTime ngayBatDau,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$kinhNguyetUpdate/$maNguoiDung',
        data: {
          'ngayBatDau': ngayBatDau.millisecondsSinceEpoch,
          'trangThai': 1,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // get kinh nguyệt
  Future<List<KinhNguyet>?> getListKinhNguyet(
    String maNguoiDung,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$kinhNguyetFind/$maNguoiDung');
      if (response.statusCode == 200) {
        List x = response.data['data'];
        List<KinhNguyet> listKN =
            x.map((e) => KinhNguyet.fromJson(jsonEncode(e))).toList();

        return listKN.isEmpty ? [] : listKN;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // insert list kinh nguyệt
  Future<bool> insertListKinhNguyet(
    List<KinhNguyet> listKinhNguyet,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      List listKN = [];
      listKinhNguyet.forEach((kinhNguyet) {
        listKN.add(kinhNguyet.toJson());
      });

      final response = await _dio.post(
        '$kinhNguyetInsert',
        data: listKN,
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // delete list kinh nguyệt
  Future<bool> deleteListKinhNguyet(
    String maNguoiDung,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.delete('$kinhNguyetDelete/$maNguoiDung');
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // đồng bộ kinh nguyệt
  Future<bool> syncKinhNguyetToServer(
    String maNguoiDung,
    List<KinhNguyet> listKinhNguyet,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      List listKN = [];
      listKinhNguyet.forEach((kinhNguyet) {
        listKN.add(kinhNguyet.toJson());
      });

      final response = await _dio.post(
        '$kinhNguyetDongbo/$maNguoiDung',
        data: listKN,
      );

      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      //return false;
      throw e;
    }
  }

  // get list nhật ký
  Future<List<NhatKy>?> getListNhatKy(
    String maNguoiDung,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$nhatKyFind/$maNguoiDung');
      if (response.statusCode == 200) {
        List x = response.data['data'];
        List<NhatKy> listNhatKy =
            x.map((e) => NhatKy.fromJson(jsonEncode(e))).toList();

        return listNhatKy.isEmpty ? null : listNhatKy;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // get list nhật ký
  Future<NhatKy?> getNhatKy(
    String maNguoiDung,
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio
          .get('$nhatKyGet/$maNguoiDung/${date.millisecondsSinceEpoch}');
      if (response.statusCode == 200) {
        return NhatKy.fromJson(jsonEncode(response.data['data']));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // delete nhật ký
  Future<bool> deteleNhatKy(
    String maNguoiDung,
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      NhatKy? nhatKy = await getNhatKy(maNguoiDung, date);
      if (nhatKy != null) {
        final response = await _dio.post('$nhatKyDelete/${nhatKy.maNhatKy}');
        if (response.statusCode == 200) {
          return true;
        }
      }

      return false;
    } catch (e) {
      throw e;
    }
  }

  //get list lượng kinh
  Future<List<LuongKinh>> getListLuongKinh() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$luongKinhFind/$maNguoiDung');
      if (response.statusCode == 200) {
        List x = response.data['data'];
        List<LuongKinh> listLuongKinh =
            x.map((e) => LuongKinh.fromJson(jsonEncode(e))).toList();
        return listLuongKinh.isEmpty ? [] : listLuongKinh;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  //get lượng kinh
  Future<LuongKinh?> getLuongKinh(
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio
          .get('$luongKinhGet/$maNguoiDung/${date.millisecondsSinceEpoch}');
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return LuongKinh.fromJson(jsonEncode(response.data['data']));
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //insert lượng kinh
  Future<bool> insertLuongKinh(LuongKinh luongKinh) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$luongKinhInsert',
        data: {
          'maNguoiDung': maNguoiDung,
          'luongKinh': luongKinh.luongKinh,
          'thoiGian': luongKinh.thoiGian.millisecondsSinceEpoch,
          'tonTai': luongKinh.tonTai,
        },
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == true) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  //xóa lượng kinh
  Future<bool> deleteLuongKinh(DateTime date) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      LuongKinh? luongKinh = await getLuongKinh(date);
      if (luongKinh != null) {
        final response =
            await _dio.delete('$luongKinhDelete/${luongKinh.maLuongKinh}');
        if (response.statusCode == 200) {
          if (response.data['data']) {
            return true;
          }
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  //insert list câu trả lời
  Future<bool> insertListCauTraLoi(
    DateTime date,
    List<String> listCauTraLoi,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      // kiểm tra xem nhật ký đã có chưa
      final response = await _dio
          .get('$nhatKyGet/$maNguoiDung/${date.millisecondsSinceEpoch}');

      if (response.statusCode == 200) {
        if (response.data['data'] == null) {
          final response = await _dio.post(
            '$nhatKyInsert',
            data: {
              'maNguoiDung': maNguoiDung,
              'thoiGian': date.millisecondsSinceEpoch,
            },
          );
          if (response.statusCode == 200) {
            int maNhatKy = response.data['data']['maNhatKy'];
            List data = [];
            for (int i = 0; i < listCauTraLoi.length; i++) {
              data.add(jsonEncode({
                'maNhatKy': maNhatKy,
                'maCauHoi': i + 1,
                'cauTraLoi': listCauTraLoi[i],
              }));
            }
            final res = await _dio.post('$cauTraLoiInsert', data: data);

            return res.data['status'];
          }
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // get quản lý que test
  Future<QuanLyQueTest?> getQuanLyQueTest() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$quanLyQueTestFind/$maNguoiDung');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data.isEmpty) {
          return null;
        } else {
          return QuanLyQueTest.fromJson(jsonEncode(data));
        }
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  // cập nhật hộp test
  Future<bool> updateHopTest(
    String maHopTest,
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$hopTestUpdate/$maHopTest',
        data: {
          'maNguoiDung': maNguoiDung,
          'thoiGian': date.millisecondsSinceEpoch,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  // insert kết quả test
  Future<TestResult?> insertKetQuaTest(
    int maQuanLyQueTest,
    int maLoaiQue,
    DateTime date,
    int ketQua,
    int? phase,
    int? testEnum,
    int? firstDate,
    int? endDate,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$ketQuaTestInsert',
        data: {
          'maNguoiDung': maNguoiDung,
          'maQuanLyQueTest': maQuanLyQueTest,
          'maLoaiQue': maLoaiQue,
          'thoiGian': date.millisecondsSinceEpoch,
          'ketQua': ketQua,
          'phase': phase,
          'testEnum': testEnum,
          'firstDate': firstDate,
          'endDate': endDate, 
          'checkUpdateVersion': true,
        },
      );
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return TestResult.fromJson(jsonEncode(response.data['data']));
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateKetQuaTest(
    int maKetQuaTest,
    int ketQua,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$ketQuaTestUpdate/$maKetQuaTest',
        data: {
          'ketQua': ketQua,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  //get list kết quả test
  Future<List<KetQuaTest>> getKetQuaTest() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$ketQuaTestFind/$maNguoiDung');
      List<KetQuaTest> listKetQua = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        data.forEach((element) {
          listKetQua.add(KetQuaTest.fromJson(jsonEncode(element)));
        });
      }
      return listKetQua;
    } catch (e) {
      return [];
    }
  }

  //get kết quả test trước đó
  Future<KetQuaTest?> getKetQuaTestBefore() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$ketQuaTestFind/$maNguoiDung');

      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isEmpty) {
          return null;
        }
        return KetQuaTest.fromJson(jsonEncode(data.first));
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  //get kết quả test đạt đỉnh trước đó trong chu kỳ hiện tại
  Future<bool?> getKetQuaTestDatDinh(
    int maQuanLyQueTest,
    DateTime begin,
    DateTime end,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
          '$ketQuaTestGetDatDinh/$maQuanLyQueTest/${begin.millisecondsSinceEpoch}/${end.millisecondsSinceEpoch}');
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //get thai kì
  Future<ThaiKi?> getThaiKi(String maNguoiDung) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$thaiKiFind/$maNguoiDung');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null) {
          return ThaiKi.fromJson(jsonEncode(data));
        }
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //insert thai kì
  Future<bool> insertThaiKi(ThaiKi thaiKi) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post('$thaiKiInsert',
          data: ThaiKi(
            maNguoiDung: maNguoiDung,
            ngayDuSinh: thaiKi.ngayDuSinh,
          ).toJson());

      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //update thai kì
  Future<bool> updateThaiKi(ThaiKi thaiKi) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post('$thaiKiUpdate/${thaiKi.maNguoiDung}',
          data: thaiKi.toJson());
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //get link
  Future<String?> getLink(
    int maLink,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$linkFind/$maLink');

      if (response.statusCode == 200) {
        if (response.data['data'] == null) {
          return null;
        } else {
          return response.data['data']['tenLink'];
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // lấy tất cả type
  Future<List<TypeBlog>> getListBlogType(
    int phase,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$blogGetListType/$phase');
      List<TypeBlog> listType = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        data.forEach((element) {
          listType.add(TypeBlog.fromJson(jsonEncode(element)));
        });
      }
      return listType;
    } catch (e) {
      //return [];
      throw e;
    }
  }

  // lấy tất cả blog
  Future<List<Blog>> getListBlog(int id) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$blogListBlog/$id');
      List<Blog> blogs = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        data.forEach((element) {
          blogs.add(Blog.fromJson(jsonEncode(element)));
        });
      }
      return blogs;
    } catch (e) {
      return [];
    }
  }

  //lấy quảng cáo
  Future<QuangCao?> getAds(
    int phase,
    int type,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$quangCaoGet/$phase/$type');
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return QuangCao.fromJson(jsonEncode(response.data['data']));
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //insert click link
  Future<bool> insertClick(
    int maLink,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      DateTime now = DateTime.now();
      final response = await _dio.post(
        '$clickInsert',
        data: {
          'maNguoiDung': maNguoiDung,
          'id_link': maLink,
          'thoiGian': '${now.year}-${now.month}-${now.day}',
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw e;
      //return false;
    }
  }
}
