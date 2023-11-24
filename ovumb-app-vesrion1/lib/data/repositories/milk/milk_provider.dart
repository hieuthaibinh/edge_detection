import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:intl/intl.dart';

class MilkProvider {
  final Dio _dio = Dio();
  final StreamController<List<PhatTrienCon>> _streamPhatTrienController =
      StreamController.broadcast();
  final StreamController<List<ChoAn>> _streamChoAnController =
      StreamController.broadcast();
  final StreamController<List<HutSua>> _streamHutSuaController =
      StreamController.broadcast();

  // insert con của 1 người dùng
  Future<bool> insert(Con con) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$conInsert',
        data: {
          'ten': con.ten,
          'ngaySinh': con.ngaySinh.millisecondsSinceEpoch,
          'gioiTinh': con.gioiTinh,
          'maNguoiDung': maNguoiDung,
          'thoiGian': DateTime.now().millisecondsSinceEpoch,
        },
      );
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // get tất cả các con của 1 người dùng
  Future<List<Con>> get() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      List<Con> listCon = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$conGet/$maNguoiDung');
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          listCon = data.map((e) => Con.fromJson(jsonEncode(e))).toList();
        }
      }
      return listCon;
    } catch (e) {
      throw 'Lỗi kết nối';
    }
  }

  // get con theo id
  Future<Con?> find(int id) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$conFind/$id');
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          return Con.fromJson(jsonEncode(data));
        }
      }
      return null;
    } catch (e) {
      throw 'Lỗi kết nối';
    }
  }

  // update con của 1 người dùng
  Future<bool> update(Con con) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$conUpdate/${con.id}',
        data: {
          'ten': con.ten,
          'ngaySinh': con.ngaySinh.millisecondsSinceEpoch,
          'gioiTinh': con.gioiTinh,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // update trạng thái con
  Future<bool> updateTrangThai(Con con) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$conUpdateTrangThai/${con.id}/$maNguoiDung',
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // delete con
  Future<bool> detele(int id) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$conDelete/$id/$maNguoiDung',
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // insert cân nặng chiều cao
  Future<bool> insertPhatTrien(PhatTrienCon phatTrienCon) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      DateTime date = DateTime(phatTrienCon.thoiGian!.year,
          phatTrienCon.thoiGian!.month, 1, 0, 0, 0, 0, 0);

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$phatTrienInsert',
        data: {
          'maCon': phatTrienCon.maCon,
          'canNang': phatTrienCon.canNang,
          'chieuCao': phatTrienCon.chieuCao,
          'thoiGian': date.millisecondsSinceEpoch,
        },
      );
      await getPhatTrien(phatTrienCon.maCon!);
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // get cân nặng chiều cao
  Future<List<PhatTrienCon>> getPhatTrien(int maCon) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$phatTrienGet/$maCon');
      List<PhatTrienCon> list = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list = data.map((e) => PhatTrienCon.fromJson(jsonEncode(e))).toList();
          _streamPhatTrienController.add(list);
          return list;
        }
      }
      _streamPhatTrienController.add(list);
      return list;
    } catch (e) {
      throw e;
    }
  }

  //insert choAn
  Future<bool?> insertChoAn(
    ChoAn choAn,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      DateTime ngayTao = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(choAn.thoiGian!));

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$choanInsert',
        data: {
          'maLoaiChoAn': choAn.maLoaiChoAn,
          'maCon': choAn.maCon,
          'trongLuong': choAn.trongLuong,
          'lanChoAn': choAn.lanChoAn,
          'thoiGian': choAn.thoiGian!.millisecondsSinceEpoch,
          'loaiThucPham': choAn.loaiThucPham,
          'vuTrai': choAn.vuTrai,
          'vuPhai': choAn.vuPhai,
          'ngayTao': ngayTao.millisecondsSinceEpoch,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data == null) {
          return null;
        } else {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //get choAn
  Future<List<ChoAn>?> getChoAnByDay(
    int maCon,
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      DateTime ngayTao = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(DateTime.now()));

      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response =
          await _dio.get('$choanGet/$maCon/${ngayTao.millisecondsSinceEpoch}');
      List<ChoAn> list = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list = data.map((e) => ChoAn.fromJson(jsonEncode(e))).toList();
          return list;
        } else {
          return [];
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //get lich su choAn
  Future<List<ChoAn>?> getChoAnHistory(
    int maCon,
    List<int> maLoaiChoAn,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get('$choanGetHistory/$maCon', data: {
        'maLoaiChoAn': maLoaiChoAn,
      });
      List<ChoAn> list = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list.addAll(data.map((e) => ChoAn.fromJson(jsonEncode(e))).toList());
        }
      } else {
        return null;
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  //get lich su choAn
  Future<List<ChoAn>?> getChoAnNgayTao(
    int maCon,
    List<int> maLoaiChoAn,
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      DateTime ngayTao =
          DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(date));

      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<ChoAn> list = [];
      _streamChoAnController.add(list);
      final response = await _dio.get(
        '$choanGetNgayTao/$maCon/${ngayTao.millisecondsSinceEpoch}',
        data: {
          'maLoaiChoAn': maLoaiChoAn,
        },
      );
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list.addAll(data.map((e) => ChoAn.fromJson(jsonEncode(e))).toList());
          _streamChoAnController.add(list);
        }
      } else {
        return null;
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  //insertTrieuChung
  Future<bool> insertTrieuChung(
    TrieuChung trieuChung,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$trieuChungInsert',
        data: {
          'dauHieu': trieuChung.dauHieu,
          'id_con': trieuChung.id_con,
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

  //get trieuchung
  Future<List<TrieuChung>?> getTrieuChung(
    int maCon,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      List<TrieuChung> list = [];
      final response = await _dio.get(
        '$trieuChungGet/$maCon',
      );
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list.addAll(
              data.map((e) => TrieuChung.fromJson(jsonEncode(e))).toList());
        }
      } else {
        return null;
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  //update trongluong
  Future<bool> updateTrongLuong(
    int maChoAn,
    num trongLuong,
    num? vuTrai,
    num? vuPhai,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post('$choanUpdate/$maChoAn', data: {
        'trongLuong': trongLuong,
        'vuTrai': vuTrai,
        'vuPhai': vuPhai,
      });
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //delete choan
  Future<bool> deleteChoAn(
    int maChoAn,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post('$choanDelete/$maChoAn');
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //insert hut sua
  Future<bool?> insertHutSua(
    HutSua hutSua,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      DateTime ngayTao = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(hutSua.ngayTao!));
      final response = await _dio.post(
        '$hutSuaInsert',
        data: {
          'maNguoiDung': maNguoiDung,
          'vuTrai': hutSua.vuTrai,
          'vuPhai': hutSua.vuPhai,
          'lanChoAn': hutSua.lanChoAn,
          'thoiGian': DateTime.now().millisecondsSinceEpoch,
          'ngayTao': ngayTao.millisecondsSinceEpoch,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null) {
          return true;
        } else {
          return null;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //get hut sua 7 ngay gan nhat
  Future<List<HutSua>?> getHutSuaHistory() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get('$hutSuaHistory/$maNguoiDung');
      List<HutSua> list = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list.addAll(data.map((e) => HutSua.fromJson(jsonEncode(e))).toList());
        }
      } else {
        return null;
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  //get hut sua theo ngay tao
  Future<List<HutSua>?> getHutSuaNgayTao(
    DateTime date,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      DateTime ngayTao =
          DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(date));
      _streamHutSuaController.add([]);
      final response = await _dio.get(
          '$hutSuaGetNgayTao/$maNguoiDung/${ngayTao.millisecondsSinceEpoch}');
      List<HutSua> list = [];
      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (data.isNotEmpty) {
          list.addAll(data.map((e) => HutSua.fromJson(jsonEncode(e))).toList());
          _streamHutSuaController.add(list);
        }
      } else {
        return null;
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  //update hut sua
  Future<bool> updateHutSua(
    int id,
    num? vuTrai,
    num? vuPhai,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.post(
        '$hutSuaUpdate/$id',
        data: {
          'vuTrai': vuTrai,
          'vuPhai': vuPhai,
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

  //delete hut sua
  Future<bool> deleteHutSua(
    int id,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.post('$hutSuaDelete/$id');
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Stream<List<PhatTrienCon>> allListPhatTrien() =>
      _streamPhatTrienController.stream;
  Stream<List<ChoAn>> allListChoAn() => _streamChoAnController.stream;
  Stream<List<HutSua>> allListHutSua() => _streamHutSuaController.stream;
}
