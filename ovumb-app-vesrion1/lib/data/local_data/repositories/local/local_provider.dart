import 'dart:async';
import 'dart:convert';
import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_tra_loi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';

class LocalProvider {
  static final LocalProvider _instance = LocalProvider._internal();
  factory LocalProvider() {
    return _instance;
  }
  LocalProvider._internal();
  final dbProvider = DatabaseProvider.db;


  //Người dùng
  //insert người dùng
  Future<int?> insertNguoiDung(
    NguoiDung nguoiDung,
  ) async {
    final db = await dbProvider.database;
    final check = await db.query(
      tableNguoiDung,
      where: 'maNguoiDung = ?',
      whereArgs: [nguoiDung.maNguoiDung],
    );
    if (check.isEmpty) {
      try {
        int id = await db.insert(tableNguoiDung, {
          'maNguoiDung': nguoiDung.maNguoiDung,
          'tenNguoiDung': nguoiDung.tenNguoiDung,
          'namSinh': nguoiDung.namSinh,
          'chieuCao': nguoiDung.chieuCao,
          'canNang': nguoiDung.canNang,
          'phase': nguoiDung.phase,
          'trangThai': nguoiDung.trangThai,
        });
        return id;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // lấy người dùng
  Future<NguoiDung> getNguoiDung(String id) async {
    try {
      final db = await dbProvider.database;
      final user = await db.query(
        tableNguoiDung,
        where: 'maNguoiDung = ?',
        whereArgs: [id],
      );
      return NguoiDung.fromJson(jsonEncode(user.first));
    } catch (e) {
      throw (e.toString());
    }
  }

  //cập nhật người dùng
  Future<bool> updateNguoiDung(
    NguoiDung nguoiDung,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableNguoiDung,
        {
          'tenNguoiDung': nguoiDung.tenNguoiDung,
          'chieuCao': nguoiDung.chieuCao,
          'canNang': nguoiDung.canNang,
        },
        where: 'maNguoiDung = ?',
        whereArgs: [nguoiDung.maNguoiDung],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //cập nhật phase người dùng
  Future<bool> updatePhase(
    int phase,
  ) async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      final db = await dbProvider.database;
      await db.update(
        tableNguoiDung,
        {
          'phase': phase,
        },
        where: 'maNguoiDung = ?',
        whereArgs: [maNguoiDung],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //insert kinh nguyệt
  Future<int?> insertKinhNguyet(
    KinhNguyet kinhNguyet,
  ) async {
    final db = await dbProvider.database;
    try {
      int id = await db.insert(
        tableKinhNguyet,
        jsonDecode(kinhNguyet.toJson()),
      );
      return id;
    } catch (e) {
      throw Exception('insert kinhnguyet fail' + e.toString());
    }
  }

  // lấy kinh nguyệt
  Future<KinhNguyet?> getKinhNguyet(String maNguoiDung) async {
    try {
      final db = await dbProvider.database;
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'maNguoiDung = ? AND trangThai = ?',
        whereArgs: [maNguoiDung, 0],
        limit: 1,
      );
      if (kinhnguyet.isEmpty) {
        return null;
      }
      return KinhNguyet.fromJson(jsonEncode(kinhnguyet.first));
    } catch (e) {
      throw (e.toString());
    }
  }



  // lấy list kinh nguyệt
  Future<List<KinhNguyet>> getListKinhNguyet(String id) async {
    try {
      final db = await dbProvider.database;
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'maNguoiDung = ?',
        whereArgs: [id],
      );

      List<KinhNguyet> listKN = [];
      kinhnguyet.forEach((element) {
        listKN.add(KinhNguyet.fromJson(jsonEncode(element)));
      });
      return listKN;
    } catch (e) {
      throw (e.toString());
    }
  }

  // lấy list kinh nguyệt đã qua
  Future<List<KinhNguyet>> getListKinhNguyetPassed(String id) async {
    try {
      final db = await dbProvider.database;
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'maNguoiDung = ? AND trangThai = ?',
        whereArgs: [id, 1],
      );
      List<KinhNguyet> listKN = [];
      kinhnguyet.forEach((element) {
        listKN.add(KinhNguyet.fromJson(jsonEncode(element)));
      });
      return listKN;
    } catch (e) {
      throw (e.toString());
    }
  }

  //cập nhật kinh nguyệt
  Future<bool> updateKinhNguyet(
    KinhNguyet kinhNguyet,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        jsonDecode(kinhNguyet.toJson()),
        where: 'maKinhNguyet = ?',
        whereArgs: [kinhNguyet.maKinhNguyet],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }


  //Câu hỏi
  //insert câu hỏi
  Future<bool> insertCauHoi(List<CauHoi> listCauHoi) async {
    final db = await dbProvider.database;
    final check = await db.query(tableCauHoi);
    if (check.isEmpty) {
      try {
        listCauHoi.forEach((e) async {
          await db.insert(tableCauHoi, {
            'maCauHoi': e.maCauHoi,
            'noiDung': e.noiDung,
          });
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  //insert câu hỏi
  Future<List<CauHoi>> getListCauHoi() async {
    final db = await dbProvider.database;
    final listCauHoi = await db.query(tableCauHoi);
    final List<CauHoi> list = [];
    listCauHoi.forEach((e) {
      list.add(CauHoi.fromJson(jsonEncode(e)));
    });
    return list;
  }

  //delete câu hỏi
  Future<bool> deleteCauHoi() async {
    final db = await dbProvider.database;
    try {
      await db.delete(tableCauHoi);
      return true;
    } catch (e) {
      return false;
    }
  }

  //Nhật ký
  //insertNhatKy
  Future<int> insertNhatKy(String id, int date, bool connected) async {
    final db = await dbProvider.database;
    final res = await getNhatKy(id, date);
    final int status = connected == true ? 1 : 0;

    // chưa có thì insert
    if (res == null) {
      try {
        final maNhatKy = await db.insert(
          tableNhatKy,
          {
            'maNguoiDung': id,
            'thoiGian': date,
            'trangThai': status,
          },
        );

        return maNhatKy;
      } catch (e) {
        throw (e.toString());
      }
    } else {
      // đã có rồi thì check xem đã tồn tại chưa, nếu đã xóa thì cập nhật lại
      if (res.tonTai == 1) {
        await db.update(
          tableNhatKy,
          {
            'tonTai': 0,
            'trangThai': 0,
          },
          where: 'thoiGian = ?',
          whereArgs: [date],
        );
      }
      return res.maNhatKy;
    }
  }

  //updateNhatKy
  Future<bool> updateNhatKy(String id, int date, bool connected) async {
    final db = await dbProvider.database;
    final res = await getNhatKy(id, date);
    final int status = connected == true ? 1 : 0;
    if (res != null) {
      try {
        await db.update(
          tableNhatKy,
          {
            'trangThai': status,
          },
          where: 'maNguoiDung = ? AND thoiGian = ?',
          whereArgs: [id, date],
        );
        return true;
      } catch (e) {
        throw (e.toString());
      }
    }
    return false;
  }

  //delete nhatky
  Future<bool> deleteNhatKy(
    int maNhatKy,
    String maNguoiDung,
  ) async {
    final db = await dbProvider.database;
    try {
      // chỉ xóa câu trả lời còn bản ghi nhật ký thì cập nhật tồn tại về 1
      await db.delete(
        tableCauTraLoi,
        where: 'maNhatKy = ?',
        whereArgs: [maNhatKy],
      );
      // await db.delete(
      //   tableNhatKy,
      //   where: 'maNhatKy = ?',
      //   whereArgs: [maNhatKy],
      // );
      await db.update(
        tableNhatKy,
        {
          'tonTai': 1,
        },
        where: 'maNhatKy = ?',
        whereArgs: [maNhatKy],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //delete tất cả nhật ký từ ngày bắt đầu đến ngày kết thúc
  Future<bool> deleteListNhatKy(
    DateTime ngayBatDau,
    DateTime ngayKetThuc,
  ) async {
    final db = await dbProvider.database;
    try {
      // lấy ra list mã nhật ký
      final listMaNhatKy = await db.query(
        tableNhatKy,
        where: 'thoiGian >= ? AND thoiGian <= ? and tonTai = ?',
        whereArgs: [
          ngayBatDau.millisecondsSinceEpoch,
          ngayKetThuc.millisecondsSinceEpoch,
          0,
        ],
        columns: ['maNhatKy'],
      );
      final list = listMaNhatKy.map((e) => e['maNhatKy'] as int).toList();
      //xóa bảng nhật ký và bảng câu trả lời
      for (int i = 0; i < list.length; i++) {
        await db.delete(tableCauTraLoi,
            where: 'maNhatKy = ?', whereArgs: [list[i]]);
        await db.update(
          tableNhatKy,
          {
            'tonTai': 1,
          },
          where: 'maNhatKy = ?',
          whereArgs: [list[i]],
        );
        // await db.delete(
        //   tableNhatKy,
        //   where: 'maNhatKy = ?',
        //   whereArgs: [list[i]],
        // );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //getNhatKy
  Future<NhatKy?> getNhatKy(String id, int date) async {
    final db = await dbProvider.database;
    try {
      final nhatKy = await db.query(
        tableNhatKy,
        where: 'maNguoiDung = ? AND thoiGian = ?',
        whereArgs: [id, date],
        limit: 1,
      );
      if (nhatKy.isNotEmpty) {
        return NhatKy.fromJson(jsonEncode(nhatKy.first));
      }
      return null;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get list NhatKy chưa đồng bộ
  Future<List<NhatKy>> getListNhatKyNotSync(String id) async {
    final db = await dbProvider.database;
    try {
      final List<NhatKy> list = [];
      //lấy ra tất cả nhật ký chưa lưu vào server và vẫn tồn tại
      final listNhatKy = await db.query(
        tableNhatKy,
        where: 'maNguoiDung = ? AND trangThai = ? AND tonTai = ?',
        whereArgs: [id, 0, 0],
      );
      listNhatKy.forEach((e) {
        list.add(NhatKy.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get list NhatKy đã xóa
  Future<List<NhatKy>> getListNhatKyDeleted(String id) async {
    final db = await dbProvider.database;
    try {
      final List<NhatKy> list = [];
      //lấy ra tất cả nhật ký đã lưu vào server và bị xóa
      final listNhatKy = await db.query(
        tableNhatKy,
        where: 'maNguoiDung = ? AND trangThai = ? AND tonTai = ?',
        whereArgs: [id, 1, 1],
      );
      listNhatKy.forEach((e) {
        list.add(NhatKy.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      throw (e.toString());
    }
  }

  //câu trả lời
  //get CauTraLoi
  Future<CauTraLoi?> getCauTraLoi(
    int maNhatKy,
    int maCauHoi,
  ) async {
    final db = await dbProvider.database;
    try {
      final cauTraLoi = await db.query(
        tableCauTraLoi,
        where: 'maNhatKy = ? AND maCauHoi = ?',
        whereArgs: [maNhatKy, maCauHoi],
      );
      if (cauTraLoi.isNotEmpty) {
        return CauTraLoi.fromJson(jsonEncode(cauTraLoi.first));
      }
      return null;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get list CauTraLoi
  Future<List<CauTraLoi>> getListCauTraLoi(
    String id,
    int date,
  ) async {
    final db = await dbProvider.database;
    try {
      final nhatKy = await getNhatKy(id, date);
      if (nhatKy == null) {
        return [];
      }
      final List<CauTraLoi> list = [];
      final listCauTraLoi = await db.query(
        tableCauTraLoi,
        where: 'maNhatKy = ?',
        whereArgs: [nhatKy.maNhatKy],
      );
      listCauTraLoi.forEach((e) {
        list.add(CauTraLoi.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      throw (e.toString());
    }
  }

  //update list CauTraLoi
  Future<bool> updateListCauTraLoi(
    String maNguoiDung,
    int date,
    List<String> listCauTraLoi,
    bool connected,
  ) async {
    try {
      final maNhatKy = await insertNhatKy(maNguoiDung, date, connected);
      for (int i = 0; i < listCauTraLoi.length; i++) {
        final res = await getCauTraLoi(maNhatKy, i + 1);
        if (res == null) {
          await insertCauTraLoi(
            maNhatKy,
            i + 1,
            listCauTraLoi[i],
          );
        } else {
          await updateCauTraLoi(
            res.maCauTraLoi,
            listCauTraLoi[i],
          );
        }
      }

      //cập nhập lại trạng thái nhật ký
      updateNhatKy(maNguoiDung, date, connected);
      return true;
    } catch (e) {
      throw e;
    }
  }

  //update list CauTraLoi
  Future<bool> insertListCauTraLoi(
    int maNhatKy,
    List<String> listCauTraLoi,
    bool connected,
  ) async {
    try {
      for (int i = 0; i < listCauTraLoi.length; i++) {
        await insertCauTraLoi(maNhatKy, i + 1, listCauTraLoi[i]);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //insert CauTraLoi
  Future<bool> insertCauTraLoi(
    int maNhatKy,
    int maCauHoi,
    String cauTraLoi,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.insert(tableCauTraLoi, {
        'maNhatKy': maNhatKy,
        'maCauHoi': maCauHoi,
        'cauTraLoi': cauTraLoi,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  //update CauTraLoi
  Future<bool> updateCauTraLoi(
    int maCauTraLoi,
    String cauTraLoi,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.update(
        tableCauTraLoi,
        {
          'cauTraLoi': cauTraLoi,
        },
        where: 'maCauTraLoi = ?',
        whereArgs: [maCauTraLoi],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // xoá dữu liệu khi đang xuất
  Future<bool> deleteAll() async {
    final db = await dbProvider.database;
    try {
      await db.delete(tableCauTraLoi);
      await db.delete(tableNhatKy);
      await db.delete(tableKinhNguyet);
      await db.delete(tableNguoiDung);
      await db.delete(tableThaiKi);
      await db.delete(tableLuongKinh);
      await db.delete(tableKetQuaTest);
      return true;
    } catch (e) {
      return false;
    }
  }

  //insert list kinh nguyệt
  Future<bool> insertListKinhNguyet(List<KinhNguyet> listKinhNguyet) async {
    try {
      for (KinhNguyet kinhNguyet in listKinhNguyet) {
        await insertKinhNguyet(kinhNguyet);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //insert thai kì
  Future<bool> insertThaiKi(ThaiKi thaiKi) async {
    try {
      final db = await dbProvider.database;
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      ThaiKi? tk = await getThaiKi(maNguoiDung);
      if (tk == null) {
        await db.insert(
            tableThaiKi,
            jsonDecode(
                ThaiKi(maNguoiDung: maNguoiDung, ngayDuSinh: thaiKi.ngayDuSinh)
                    .toJson()));
      } else {
        await updateThaiKi(
          ThaiKi(
            maNguoiDung: maNguoiDung,
            ngayDuSinh: thaiKi.ngayDuSinh,
            trangThai: 0,
          ),
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //get thai kì
  Future<ThaiKi?> getThaiKi(String maNguoiDung) async {
    final db = await dbProvider.database;
    try {
      final thaiKi = await db.query(
        tableThaiKi,
        where: 'maNguoiDung = ?',
        whereArgs: [maNguoiDung],
        limit: 1,
      );
      if (thaiKi.isNotEmpty) {
        return ThaiKi.fromJson(jsonEncode(thaiKi.first));
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  //update thai kì
  Future<bool> updateThaiKi(ThaiKi thaiKi) async {
    final db = await dbProvider.database;
    try {
      await db.update(
        tableThaiKi,
        {
          'ngayDuSinh': thaiKi.ngayDuSinh!.millisecondsSinceEpoch,
          'trangThai': thaiKi.trangThai,
        },
        where: 'maNguoiDung = ?',
        whereArgs: [thaiKi.maNguoiDung],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //delete thai kì
  Future<bool> deleteThaiKi(String maNguoiDung) async {
    final db = await dbProvider.database;
    try {
      await db.delete(
        tableThaiKi,
        where: 'maNguoiDung = ?',
        whereArgs: [maNguoiDung],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

}
