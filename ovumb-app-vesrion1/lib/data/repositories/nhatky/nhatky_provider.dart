import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_tra_loi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';

class NhatKyProvider {
  static final NhatKyProvider _instance = NhatKyProvider._internal();
  factory NhatKyProvider() {
    return _instance;
  }
  NhatKyProvider._internal();
  final dbProvider = DatabaseProvider.db;

  //get nhật ký
  Future<NhatKy?> getNhatKy(
    String id,
    DateTime date,
  ) async {
    final db = await dbProvider.database;
    try {
      final nhatKy = await db.query(
        tableNhatKy,
        where: 'maNguoiDung = ? AND thoiGian = ?',
        whereArgs: [id, date.millisecondsSinceEpoch],
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

  //insert nhật ký
  Future<int> insertNhatKy(
    String id,
    DateTime date,
  ) async {
    final db = await dbProvider.database;
    final res = await getNhatKy(id, date);

    // chưa có thì insert
    if (res == null) {
      try {
        final maNhatKy = await db.insert(
          tableNhatKy,
          {
            'maNguoiDung': id,
            'thoiGian': date.millisecondsSinceEpoch,
            'trangThai': 0,
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

  //get list nhật ký tồn tại
  Future<List<NhatKy>> getListNhatKy(String id) async {
    final db = await dbProvider.database;
    try {
      final List<NhatKy> list = [];
      final listNhatKy = await db.query(
        tableNhatKy,
        where: 'maNguoiDung = ? AND tonTai = ?',
        whereArgs: [id, 0],
      );
      listNhatKy.forEach((e) {
        list.add(NhatKy.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get list câu trả lời
  Future<List<CauTraLoi>> getListCauTraLoi(
    String id,
    DateTime date,
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

  //update lại trạng thái nhật ký
  Future<bool> updateNhatKyStatus(
      String id, DateTime date, bool connected) async {
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
          whereArgs: [id, date.millisecondsSinceEpoch],
        );
        return true;
      } catch (e) {
        throw (e.toString());
      }
    }
    return false;
  }

  //update list CauTraLoi
  Future<bool> updateListCauTraLoi(
    String maNguoiDung,
    DateTime date,
    List<String> listCauTraLoi,
  ) async {
    try {
      final maNhatKy = await insertNhatKy(maNguoiDung, date);
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
      updateNhatKyStatus(maNguoiDung, date, false);
      return true;
    } catch (e) {
      throw e;
    }
  }

  //get lượng kinh còn tồn tại
  Future<LuongKinh?> getLuongKinh(
    String id,
    DateTime date,
  ) async {
    final db = await dbProvider.database;
    try {
      final luongKinh = await db.query(
        tableLuongKinh,
        where: 'maNguoiDung = ? AND thoiGian = ? AND tonTai = ?',
        whereArgs: [id, date.millisecondsSinceEpoch, 0],
        limit: 1,
      );
      return LuongKinh.fromJson(jsonEncode(luongKinh.first));
    } catch (e) {
      return null;
    }
  }

  //delete lượng kinh
  Future<bool> deleteLuongKinh(
    int maLuongKinh,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.update(
        tableLuongKinh,
        {
          'tonTai': 1,
        },
        where: 'maLuongKinh = ?',
        whereArgs: [maLuongKinh],
      );
      return true;
    } catch (e) {
      return true;
    }
  }

  //delete hẳn lượng kinh
  Future<bool> deleteLuongKinh1(
    int maLuongKinh,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.delete(
        tableLuongKinh,
        where: 'maLuongKinh = ?',
        whereArgs: [maLuongKinh],
      );
      return true;
    } catch (e) {
      return true;
    }
  }

  //delete list lượng kinh
  Future<bool> deleteListLuongKinh(
    DateTime begin,
    DateTime end,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.update(
        tableLuongKinh,
        {
          'tonTai': 1,
        },
        where: 'thoiGian >= ? AND thoiGian <= ?',
        whereArgs: [
          begin.millisecondsSinceEpoch,
          end.millisecondsSinceEpoch,
        ],
      );
      return true;
    } catch (e) {
      return true;
    }
  }

  //delete list lượng kinh
  Future<bool> deleteLuongKinhByTime(
    DateTime date,
  ) async {
    final db = await dbProvider.database;
    try {
      await db.update(
        tableLuongKinh,
        {
          'tonTai': 1,
        },
        where: 'thoiGian > ?',
        whereArgs: [date.millisecondsSinceEpoch],
      );
      return true;
    } catch (e) {
      return true;
    }
  }

  //get lượng kinh
  Future<List<LuongKinh>> getListLuongKinh(
    String id,
    int tonTai,
  ) async {
    final db = await dbProvider.database;
    try {
      final luongKinh = await db.query(
        tableLuongKinh,
        where: 'maNguoiDung = ? AND tonTai = ?',
        whereArgs: [id, tonTai],
      );
      final List<LuongKinh> list = [];
      luongKinh.forEach((e) {
        list.add(LuongKinh.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<LuongKinh>> getListLuongKinhSync(
    String id,
  ) async {
    final db = await dbProvider.database;
    try {
      final luongKinh = await db.query(
        tableLuongKinh,
        where: 'maNguoiDung = ? AND trangThai = ? AND tonTai = ?',
        whereArgs: [id, 0, 0],
      );
      final List<LuongKinh> list = [];
      luongKinh.forEach((e) {
        list.add(LuongKinh.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      return [];
    }
  }

  //get lượng kinh
  Future<bool> insertLuongKinh(
    String id,
    DateTime date,
    String luongKinh,
  ) async {
    final db = await dbProvider.database;
    try {
      final res = await db.query(
        tableLuongKinh,
        where: 'maNguoiDung = ? AND thoiGian = ?',
        whereArgs: [id, date.millisecondsSinceEpoch],
        limit: 1,
      );

      if (res.isNotEmpty) {
        LuongKinh kinh = LuongKinh.fromJson(jsonEncode(res.first));
        await db.update(
            tableLuongKinh,
            {
              'luongKinh': luongKinh,
              'trangThai': 0,
              'tonTai': 0,
            },
            where: 'maLuongKinh = ?',
            whereArgs: [kinh.maLuongKinh]);
      } else {
        await db.insert(
          tableLuongKinh,
          {
            'maNguoiDung': id,
            'luongKinh': luongKinh,
            'thoiGian': date.millisecondsSinceEpoch,
            'trangThai': 0,
            'tonTai': 0,
          },
        );
      }
      return true;
    } catch (e) {
      throw e;
    }
  }

  //insert list lượng kinh
  Future<bool> insertListLuongKinh(
    String id,
    DateTime begin,
    DateTime end,
    String luongKinh,
  ) async {
    try {
      List<DateTime> days = [];
      begin = begin.add(Duration(days: 1));
      while (begin.isBefore(end)) {
        days.add(begin);
        begin = begin.add(Duration(days: 1));
      }
      for (int i = 0; i < days.length; i++) {
        await insertLuongKinh(
          id,
          days[i],
          luongKinh,
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //update trạng thái
  Future<bool> updateTrangThaiLuongKinh(
    int maLuongKinh,
    int trangThai,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableLuongKinh,
        {
          'trangThai': trangThai,
        },
        where: 'maLuongKinh = ?',
        whereArgs: [maLuongKinh],
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  // lấy tất cả lượng kinh trong khoảng thời gian
  Future<List<LuongKinh>> getLuongKinhByDate(
    String id,
    DateTime begin,
    DateTime end,
  ) async {
    try {
      final db = await dbProvider.database;
      final res = await db.query(
        tableLuongKinh,
        where:
            'maNguoiDung = ? AND thoiGian >= ? AND thoiGian <= ? AND tonTai = ?',
        whereArgs: [
          id,
          begin.millisecondsSinceEpoch,
          end.millisecondsSinceEpoch,
          0,
        ],
      );
      List<LuongKinh> listLuongKinh = [];
      res.forEach((e) {
        listLuongKinh.add(LuongKinh.fromJson(jsonEncode(e)));
      });
      return listLuongKinh;
    } catch (e) {
      return [];
    }
  }
}
