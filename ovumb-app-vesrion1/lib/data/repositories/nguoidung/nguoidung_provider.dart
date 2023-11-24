import 'dart:convert';
import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';

class NguoiDungProvider {
  static final NguoiDungProvider _instance = NguoiDungProvider._internal();
  factory NguoiDungProvider() {
    return _instance;
  }
  NguoiDungProvider._internal();
  final dbProvider = DatabaseProvider.db;

  // lấy trạng thái để gọi đồng bộ, nếu bằng null,0 là chưa đồng bộ, 1 là đã đồng bộ
  Future<int?> getTrangThai() async {
    try {
      final db = await dbProvider.database;
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      final user = await db.query(
        tableNguoiDung,
        where: 'maNguoiDung = ?',
        whereArgs: [maNguoiDung],
      );
      NguoiDung nguoiDung = NguoiDung.fromJson(jsonEncode(user.first));
      return nguoiDung.trangThai;
    } catch (e) {
      throw e;
      //throw e;
    }
  }

  // update trạng thái sau khi đã đồng bộ
  Future<bool> updateTrangThai(int trangThai) async {
    try {
      final db = await dbProvider.database;
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      await db.update(
        tableNguoiDung,
        {
          'trangThai': trangThai,
        },
        where: 'maNguoiDung = ?',
        whereArgs: [maNguoiDung],
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
