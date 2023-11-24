import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';

class LuongKinhProvider {
  static final LuongKinhProvider _instance = LuongKinhProvider._internal();
  factory LuongKinhProvider() {
    return _instance;
  }
  LuongKinhProvider._internal();
  final dbProvider = DatabaseProvider.db;

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
          'trangThai': 0,
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

  //get lượng kinh từ ngày đầu đến ngày cuối
  Future<List<LuongKinh>> getListLuongKinhFromTo(
    DateTime begin,
    DateTime end,
  ) async {
    final db = await dbProvider.database;
    String maNguoiDung = await SharedPreferencesService.getId() ?? '';
    try {
      final luongKinh = await db.query(
        tableLuongKinh,
        where:
            'maNguoiDung = ? AND tonTai = ? AND thoiGian >= ? AND thoiGian <= ?',
        whereArgs: [
          maNguoiDung,
          0,
          begin.millisecondsSinceEpoch,
          end.millisecondsSinceEpoch
        ],
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
      while (begin.isBefore(end)) {
        days.add(begin);
        begin = begin.add(Duration(days: 1));
      }
      days.add(begin);
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
