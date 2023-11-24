import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:intl/intl.dart';

class KetQuaTestProvider {
  static final KetQuaTestProvider _instance = KetQuaTestProvider._internal();
  factory KetQuaTestProvider() {
    return _instance;
  }
  KetQuaTestProvider._internal();
  final dbProvider = DatabaseProvider.db;

  //get kết quả test
  Future<KetQuaTest?> getKetQuaTest(DateTime thoiGian) async {
    try {
      final db = await dbProvider.database;
      int date = DateTime(thoiGian.year, thoiGian.month, thoiGian.day)
          .millisecondsSinceEpoch;
      final ketQua = await db.query(
        tableKetQuaTest,
        where: 'thoiGian = ?',
        whereArgs: [date],
      );
      return KetQuaTest.fromJson(jsonEncode(ketQua.first));
    } catch (e) {
      return null;
    }
  }

  //insert ketquatest
  Future<bool> insertKetQuaTest(KetQuaTest ketQua) async {
    try {
      final db = await dbProvider.database;
      DateTime now = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(ketQua.thoiGian));
      await db.insert(
        tableKetQuaTest,
        {
          'maLoaiQue': ketQua.maLoaiQue,
          'lanTest': ketQua.lanTest,
          'thoiGian': now.millisecondsSinceEpoch,
          'ketQua': ketQua.ketQua,
        },
      );
      return true;
    } catch (e) {
      //return false;
      throw e;
    }
  }

  //insert list ketquatest
  Future<bool> insertListKetQuaTest(List<KetQuaTest> listKetQua) async {
    try {
      for (int i = 0; i < listKetQua.length; i++) {
        await insertKetQuaTest(listKetQua[i]);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //get list ket qua test
  Future<List<KetQuaTest>> getListKetQuaTest() async {
    final db = await dbProvider.database;
    try {
      final List<KetQuaTest> list = [];
      final listKetQuaTest = await db.query(
        tableKetQuaTest,
      );
      listKetQuaTest.forEach((e) {
        list.add(KetQuaTest.fromJson(jsonEncode(e)));
      });
      return list;
    } catch (e) {
      return [];
    }
  }
}
