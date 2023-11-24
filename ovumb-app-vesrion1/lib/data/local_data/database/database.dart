import 'dart:io';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider db = DatabaseProvider();
  static const dbName = 'ouvmb.db';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    if (_database != null) {
      return true;
    }
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}/$dbName';
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(createNguoiDung);
    await database.execute(createKinhNguyet);
    await database.execute(createCauHoi);
    await database.execute(createCauTraLoi);
    await database.execute(createNhatKy);
    await database.execute(createLuongKinh);
    await database.execute(createThaiKi);
    await database.execute(createKetQuaTest);
    await database.execute(createProduct);
  }
}
