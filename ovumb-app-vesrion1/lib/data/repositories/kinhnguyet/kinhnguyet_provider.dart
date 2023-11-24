import 'dart:async';
import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/ketquatest/ketquatest_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/luongkinh/luongkinh_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nguoidung/nguoidung_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nhatky/nhatky_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_generate.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/calendar.dart';
import 'package:intl/intl.dart';

class KinhNguyetProvider {
  static final KinhNguyetProvider _instance = KinhNguyetProvider._internal();
  factory KinhNguyetProvider() {
    return _instance;
  }
  KinhNguyetProvider._internal();
  final dbProvider = DatabaseProvider.db;

  final StreamController<CalendarDay> _streamDayController =
      StreamController.broadcast();

  NhatKyRepository _nhatkyRepository = NhatKyRepository();
  LocalRepository _localRepository = LocalRepository();
  KetQuaTestRepository _ketQuaTestRepository = KetQuaTestRepository();
  LuongKinhRepository _luongKinhRepository = LuongKinhRepository();

  // lấy dữ liệu
  Future<CalendarDay> getCalendarDay(String id) async {
    try {
      List<DateTime> listKinh = [];
      List<DateTime> listTrung = [];
      List<DateTime> listAnToanTuongDoi = [];
      List<DateTime> listAnToanTuyetDoi = [];
      final user = await _localRepository.getNguoiDung(id);

      List<KetQuaTest> listKetQua =
          await _ketQuaTestRepository.getListKetQuaTest();
      List<KetQuaTest> listKetQuaLast = [];
      List<DateTime> listLH = [];
      List<DateTime> listLHDD = [];
      listKetQua.forEach((e) {
        if (!listLH.contains(e.thoiGian)) {
          listLH.add(e.thoiGian);
          listKetQuaLast.add(e);
        } else {
          listKetQuaLast.removeAt(listKetQuaLast.length - 1);
          listKetQuaLast.add(e);
        }
        if (e.ketQua > 45) {
          if (!listLHDD.contains(e.thoiGian)) {
            listLHDD.add(e.thoiGian);
          }
        }
      });

      List<LuongKinh> listLuongKinh = await _nhatkyRepository.getListLuongKinh(
        maNguoiDung: id,
        tonTai: 0,
      );

      List<NhatKy> listNhatKy =
          await _nhatkyRepository.getListNhatKy(maNguoiDung: id);

      //lấy ra tất cả kinh nguyệt và tính
      List<KinhNguyet> listKinhNguyet = await getListKinhNguyet(id);
      listKinhNguyet.forEach((kn) {
        DateTime beginT = kn.ngayBatDauTrung!;
        DateTime endT = kn.ngayKetThucTrung!;
        DateTime beginK = kn.ngayBatDauKinh!;
        DateTime endK = kn.ngayKetThucKinh!;
        DateTime begin = kn.ngayBatDau!;
        DateTime end = kn.ngayKetThuc!;

        List<DateTime> listK = List<DateTime>.generate(
            endK.difference(beginK).inDays + 1,
            (index) => beginK.add(Duration(days: index)));

        List<DateTime> listT = [];
        if (kn.trangThai != 0) {
          listT = List<DateTime>.generate(endT.difference(beginT).inDays + 1,
              (index) => beginT.add(Duration(days: index)));
        }

        List<DateTime> listAll = List<DateTime>.generate(
            end.difference(begin).inDays + 1,
            (index) => begin.add(Duration(days: index)));

        List<DateTime> times = listLuongKinh.map((e) => e.thoiGian).toList();

        Set<DateTime> set1 = Set.from(listK);
        Set<DateTime> set2 = Set.from(times);
        Set<DateTime> setAll = Set.from(listAll);
        Set<DateTime> intersectionSet = set1.intersection(set2);
        Set<DateTime> setLH = Set.from(listLHDD);
        Set<DateTime> intersectionSetLH = setLH.intersection(setAll);
        List<DateTime> setToList = intersectionSet.toList();
        List<DateTime> setToListLH = intersectionSetLH.toList();

        if (setToList.isNotEmpty) {
          listKinh.addAll(setToList);
          if (setToListLH.isEmpty) {
            listTrung.addAll(listT);
          }
        } else {
          if (setToListLH.isEmpty) {
            listKinh.addAll(listK);
            listTrung.addAll(listT);
          }
        }
        if (kn.trangThai != 0 && user.phase == 2) {
          DateTime beginAT = kn.ngayKetThucTrung!.add(const Duration(days: 1));
          DateTime endAT = kn.ngayKetThuc!;
          if (beginAT.isBefore(endAT)) {
            List<DateTime> listAT = List<DateTime>.generate(
                endAT.difference(beginAT).inDays + 1,
                (index) => beginAT.add(Duration(days: index)));
            if (setToListLH.isEmpty) {
              listAnToanTuongDoi.addAll(listAT);
            } else {
              DateTime last = setToListLH.last.add(Duration(days: 6));
              if (last.isBefore(endAT)) {
                List<DateTime> listAT = List<DateTime>.generate(
                    endAT.difference(last).inDays + 1,
                    (index) => last.add(Duration(days: index)));
                listAnToanTuyetDoi.addAll(listAT);
              }
            }
          }
        }
      });

      //lấy ra kinh nguyệt dự đoán và thêm các kinh nguyệt dự đoán
      KinhNguyet lastKinhNguyet = listKinhNguyet.last;
      int nct = testDay[lastKinhNguyet.tbnkn]! - 1;
      if (nct < lastKinhNguyet.snck) {
        nct = lastKinhNguyet.snck;
      }

      DateTime begin = lastKinhNguyet.ngayKetThuc!.add(Duration(days: 1));
      for (int i = 0; i < 3; i++) {
        DateTime end = begin.add(Duration(days: lastKinhNguyet.tbnkn - 1));
        DateTime beginK = begin;
        DateTime endK = beginK.add(Duration(days: lastKinhNguyet.snck - 1));
        DateTime beginT = begin.add(Duration(days: nct));
        DateTime endT = beginT.add(Duration(days: 6));
        List<DateTime> listK = List<DateTime>.generate(
            endK.difference(beginK).inDays + 1,
            (index) => beginK.add(Duration(days: index)));

        List<DateTime> listT = List<DateTime>.generate(
            endT.difference(beginT).inDays + 1,
            (index) => beginT.add(Duration(days: index)));

        listKinh.addAll(listK);
        listTrung.addAll(listT);
        begin = end.add(Duration(days: 1));

        if (i != 2 && user.phase == 2) {
          DateTime beginAT = listK.last.add(const Duration(days: 1));
          DateTime endAT = beginT.subtract(const Duration(days: 5));

          //tuyệt đối
          beginAT = endT.add(const Duration(days: 1));
          endAT = end;

          if (beginAT.isBefore(endAT)) {
            List<DateTime> listAT = List<DateTime>.generate(
                endAT.difference(beginAT).inDays + 1,
                (index) => beginAT.add(Duration(days: index)));
            listAnToanTuongDoi.addAll(listAT);
          }
        }
      }

      //lấy ra kinh nguyệt hiện tại
      KinhNguyet? currentKinhNguyet = await getKinhNguyet(1);
      KinhNguyet? futureKinhNguyet = await getKinhNguyet(2);
      _streamDayController.sink.add(
        CalendarDay(
          listKinh: listKinh,
          listTrung: listTrung,
          listAnToanTuongDoi: listAnToanTuongDoi,
          listAnToanTuyetDoi: listAnToanTuyetDoi,
          listNhatKy: listNhatKy,
          listKetQuaTest: listKetQuaLast,
          listLuongKinh: listLuongKinh,
          listKinhNguyet: listKinhNguyet,
          listLH: listLH,
          currentKinhNguyet: currentKinhNguyet!,
          futureKinhNguyet: futureKinhNguyet!,
        ),
      );
      return CalendarDay(
        listKinh: listKinh,
        listTrung: listTrung,
        listNhatKy: listNhatKy,
        listAnToanTuongDoi: listAnToanTuongDoi,
        listAnToanTuyetDoi: listAnToanTuyetDoi,
        listKetQuaTest: listKetQuaLast,
        listLuongKinh: listLuongKinh,
        listKinhNguyet: listKinhNguyet,
        listLH: listLH,
        currentKinhNguyet: currentKinhNguyet,
        futureKinhNguyet: futureKinhNguyet,
      );
    } catch (e) {
      throw (e.toString());
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

  //insert list kinh nguyệt
  Future<bool> insertListKinhNguyet(
    String maNguoiDung,
    List<KinhNguyet> listKinhNguyet,
    String? luongKinh,
    bool? isSync,
  ) async {
    try {
      for (KinhNguyet kinhNguyet in listKinhNguyet) {
        await insertKinhNguyet(kinhNguyet);
        //kiểm tra xem là đồng bộ từ server hay insert mới
        if (isSync == null) {
          if (kinhNguyet.trangThai == 0) {
            List<LuongKinh> listLuongKinh =
                await _luongKinhRepository.getListLuongKinhFromTo(
              begin: kinhNguyet.ngayBatDauKinh!,
              end: kinhNguyet.ngayKetThucKinh!,
            );
            //nếu chưa có lượng kinh thì insert
            if (listLuongKinh.isEmpty) {
              await _luongKinhRepository.insertListLuongKinh(
                maNguoiDung: maNguoiDung,
                begin: kinhNguyet.ngayBatDauKinh!,
                end: kinhNguyet.ngayKetThucKinh!,
                luongKinh: luongKinh ?? 'Trung bình',
              );
            }
          } else if (kinhNguyet.trangThai == 1) {
            List<LuongKinh> listLuongKinh =
                await _luongKinhRepository.getListLuongKinhFromTo(
              begin: kinhNguyet.ngayBatDauKinh!,
              end: kinhNguyet.ngayKetThucKinh!,
            );
            //nếu chưa có lượng kinh thì insert
            if (listLuongKinh.isEmpty) {
              DateTime now = DateTime.parse(
                  DateFormat('yyyy-MM-dd 00:00:00.000').format(DateTime.now()));
              DateTime date = now;
              if (now.isAfter(kinhNguyet.ngayKetThucKinh!)) {
                date = kinhNguyet.ngayKetThucKinh!;
              }
              await _luongKinhRepository.insertListLuongKinh(
                maNguoiDung: maNguoiDung,
                begin: kinhNguyet.ngayBatDauKinh!,
                end: date,
                luongKinh: luongKinh ?? 'Trung bình',
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

  //get list kinh nguyệt theo trạng thái
  Future<KinhNguyet?> getKinhNguyet(
    int trangThai,
  ) async {
    try {
      final db = await dbProvider.database;
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'maNguoiDung = ? AND trangThai = ?',
        whereArgs: [maNguoiDung, trangThai],
      );
      return KinhNguyet.fromJson(jsonEncode(kinhnguyet.first));
    } catch (e) {
      return null;
    }
  }

  //update Trạng thái kinh nguyệt
  Future<bool> updateTrangThai(
    int maKinhNguyet,
    int trangThai,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        {
          'trangThai': trangThai,
        },
        where: 'maKinhNguyet = ?',
        whereArgs: [maKinhNguyet],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //get list kinh nguyệt
  Future<List<KinhNguyet>> getListKinhNguyet(String maNguoiDung) async {
    try {
      final db = await dbProvider.database;
      //lấy ra tất cả kinh nguyệt theo thứ tự tăng dần
      /*
        trạng thái
        0: đã qua
        1: hiện tại
        2: tương lai
      */
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'maNguoiDung = ? AND trangThai IN (?, ?, ?)',
        whereArgs: [maNguoiDung, 0, 1, 2],
        orderBy: 'trangThai ASC',
      );

      List<KinhNguyet> listKN = [];
      kinhnguyet.forEach((element) {
        listKN.add(KinhNguyet.fromJson(jsonEncode(element)));
      });
      return listKN;
    } catch (e) {
      return [];
    }
  }

  // cập nhật trạng thái kinh nguyệt khi đã qua
  Future<bool> updateTrangThaiKNCurrent(
    String maNguoiDung,
  ) async {
    try {
      DateTime now = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(DateTime.now()));
      KinhNguyet? current = await getKinhNguyetByStatus(1);

      if (current!.ngayKetThuc!.isBefore(now)) {
        List<LuongKinh> listLuongKinh =
            await _luongKinhRepository.getListLuongKinhFromTo(
          begin: current.ngayBatDauKinh!,
          end: current.ngayKetThucKinh!,
        );
        if (listLuongKinh.isEmpty) {
          await _luongKinhRepository.insertListLuongKinh(
            maNguoiDung: maNguoiDung,
            begin: current.ngayBatDauKinh!,
            end: current.ngayKetThucKinh!,
            luongKinh: 'Trung bình',
          );
        }
        await updateTrangThai(current.maKinhNguyet!, 0);
        await deleteKinhNguyetByTime(
            current.ngayKetThuc!.add(Duration(days: 1)));
        final listNewKinhNguyet = CalendarGenerate.generateListKN(
          kinhNguyet: KinhNguyet(
            ngayBatDau: current.ngayKetThuc!.add(Duration(days: 1)),
            tbnkn: current.tbnkn,
            snck: current.snck,
            snct: current.snct,
            ckdn: current.ckdn,
            cknn: current.cknn,
          ),
          maNguoiDung: maNguoiDung,
        );
        await insertListKinhNguyet(maNguoiDung, listNewKinhNguyet, null, true);
        await getCalendarDay(maNguoiDung);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //lấy ra kinh nguyệt đang chọn
  int selectedKinhNguyet(
    DateTime date,
    List<KinhNguyet> listKinhNguyet,
  ) {
    //kiểm tra xem nằm trong chu kì nào
    for (int i = 0; i < listKinhNguyet.length; i++) {
      DateTime begin = listKinhNguyet[i].ngayBatDau!;
      DateTime end = listKinhNguyet[i].ngayKetThuc!;
      if (checkBetween(date, begin, end)) {
        return i;
      }
    }

    //nếu không nằm trong chu kì nào thì return -1;
    return -1;
  }

  //cập nhật ngày kết thúc
  Future<bool> updateKinhNguyetLastDay(
    int maKinhNguyet,
    DateTime ngayKetThuc,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        {
          'ngayKetThuc': ngayKetThuc.millisecondsSinceEpoch,
        },
        where: 'maKinhNguyet = ?',
        whereArgs: [maKinhNguyet],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  // lấy kinh nguyệt theo trạng thái
  Future<KinhNguyet?> getKinhNguyetByStatus(
    int trangThai,
  ) async {
    try {
      final db = await dbProvider.database;
      final kinhnguyet = await db.query(
        tableKinhNguyet,
        where: 'trangThai = ?',
        whereArgs: [trangThai],
        limit: 1,
      );
      if (kinhnguyet.isEmpty) {
        return null;
      }
      return KinhNguyet.fromJson(jsonEncode(kinhnguyet.first));
    } catch (e) {
      return null;
    }
  }

  // xóa kinh nguyệt dự đoán
  Future<bool> deleteFutureKinhNguyet() async {
    try {
      final db = await dbProvider.database;
      final check = await getKinhNguyetByStatus(3);
      if (check == null) {
        await db.update(
          tableKinhNguyet,
          {
            'trangThai': 3,
          },
          where: 'trangThai = ?',
          whereArgs: [2],
        );
      } else {
        await db.delete(
          tableKinhNguyet,
          where: 'trangThai = ?',
          whereArgs: [2],
        );
      }
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  // xóa kinh nguyệt hiện tại
  Future<bool> deleteCurrentKinhNguyet() async {
    try {
      final db = await dbProvider.database;
      await db.delete(
        tableKinhNguyet,
        where: 'trangThai = ?',
        whereArgs: [1],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //xóa hết kinh nguyệt, reset lại từ đầu
  Future<bool> deleteKinhNguyetByTime(
    DateTime date,
  ) async {
    try {
      final db = await dbProvider.database;
      await _nhatkyRepository.deleteLuongKinhByTime(date: date);
      await db.delete(
        tableKinhNguyet,
        where: 'ngayKetThuc >= ?',
        whereArgs: [date.millisecondsSinceEpoch],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //xóa hết kinh nguyệt
  Future<bool> deleteAllKinhNguyet(
    DateTime date,
  ) async {
    try {
      final db = await dbProvider.database;
      await _nhatkyRepository.deleteLuongKinhByTime(date: date);
      await db.delete(
        tableKinhNguyet,
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //updae kinh nguyệt by trạng thái
  Future<bool> updateKinhNguyetByStatus(
    KinhNguyet kinhNguyet,
    int trangThai,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        {
          'tbnkn': kinhNguyet.tbnkn,
          'snck': kinhNguyet.snck,
          'snct': kinhNguyet.snct,
          'ckdn': kinhNguyet.ckdn,
          'cknn': kinhNguyet.cknn,
          'ngayBatDau': kinhNguyet.ngayBatDau!.millisecondsSinceEpoch,
          'ngayKetThuc': kinhNguyet.ngayKetThuc!.millisecondsSinceEpoch,
          'ngayBatDauKinh': kinhNguyet.ngayBatDauKinh!.millisecondsSinceEpoch,
          'ngayKetThucKinh': kinhNguyet.ngayKetThucKinh!.millisecondsSinceEpoch,
          'ngayBatDauTrung': kinhNguyet.ngayBatDauTrung!.millisecondsSinceEpoch,
          'ngayKetThucTrung':
              kinhNguyet.ngayKetThucTrung!.millisecondsSinceEpoch,
        },
        where: 'trangThai = ?',
        whereArgs: [trangThai],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //updae kinh nguyệt by trạng thái
  Future<bool> updateKinhNguyetById(
    KinhNguyet kinhNguyet,
    int maKinhNguyet,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        {
          'tbnkn': kinhNguyet.tbnkn,
          'snck': kinhNguyet.snck,
          'snct': kinhNguyet.snct,
          'ckdn': kinhNguyet.ckdn,
          'cknn': kinhNguyet.cknn,
          'ngayBatDau': kinhNguyet.ngayBatDau!.millisecondsSinceEpoch,
          'ngayKetThuc': kinhNguyet.ngayKetThuc!.millisecondsSinceEpoch,
          'ngayBatDauKinh': kinhNguyet.ngayBatDauKinh!.millisecondsSinceEpoch,
          'ngayKetThucKinh': kinhNguyet.ngayKetThucKinh!.millisecondsSinceEpoch,
          'ngayBatDauTrung': kinhNguyet.ngayBatDauTrung!.millisecondsSinceEpoch,
          'ngayKetThucTrung':
              kinhNguyet.ngayKetThucTrung!.millisecondsSinceEpoch,
          'trangThai': kinhNguyet.trangThai,
        },
        where: 'maKinhNguyet = ?',
        whereArgs: [maKinhNguyet],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  // xóa kinh nguyệt bởi trạng thái
  Future<bool> deleteKinhNguyetByStatus(int trangThai) async {
    try {
      final db = await dbProvider.database;
      await db.delete(
        tableKinhNguyet,
        where: 'trangThai = ?',
        whereArgs: [trangThai],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //cập nhật ngày có kinh và ngày kết thúc kinh
  Future<bool> updateNgayKinh(
    int maKinhNguyet,
    DateTime ngayKetThucKinh,
    int snck,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableKinhNguyet,
        {
          'ngayKetThucKinh': ngayKetThucKinh.millisecondsSinceEpoch,
          'snck': snck,
        },
        where: 'maKinhNguyet = ?',
        whereArgs: [maKinhNguyet],
      );
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  // tạo kì kinh nguyệt mới
  KinhNguyet createNewKinhNguyet({
    required String maNguoiDung,
    required DateTime begin,
    required KinhNguyet current,
    required int tbnknNew,
    required int? snck,
    required bool isUpdate,
  }) {
    // trung bình kình kinh nguyệt
    int tb = (current.tbnkn * 2 + tbnknNew) ~/ 3;
    if (isUpdate) {
      // nếu mà là chỉnh sửa lại ngày trung bình thì sẽ giữ nguyên, không tính trung bình của cách tháng trước
      tb = tbnknNew;
    }

    if (snck == null) {
      snck = current.snck;
    }
    if (snck > 7) {
      snck = 7;
    }

    int nct = testDay[tb]! - 1; //ngày có trứng
    if (nct < snck) {
      nct = snck;
    }

    // cập nhật lại ngày tháng
    DateTime end = begin.add(Duration(days: tb - 1));
    DateTime beginK = begin;
    DateTime endK = beginK.add(Duration(days: snck - 1));
    DateTime beginT = begin.add(Duration(days: nct));
    DateTime endT = beginT.add(Duration(days: 6));

    //tính trạng thái
    DateFormat formatter =
        DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
    DateTime now = DateTime.parse(formatter.format(DateTime.now()));
    int trangThai = 1;
    if (end.isBefore(now) && begin.isBefore(now)) {
      trangThai = 0;
    } else if (now.isAfter(end) && now.isAfter(begin)) {
      trangThai = 2;
    }

    return KinhNguyet(
      maNguoiDung: maNguoiDung,
      tbnkn: tb,
      snck: snck,
      snct: 6,
      ckdn: current.ckdn,
      cknn: current.cknn,
      ngayBatDau: begin,
      ngayKetThuc: end,
      ngayBatDauKinh: beginK,
      ngayKetThucKinh: endK,
      ngayBatDauTrung: beginT,
      ngayKetThucTrung: endT,
      trangThai: trangThai,
    );
  }

  // lấy lại kinh nguyệt ban đầu
  Future<KinhNguyet?> restoreKinhNguyet(
    String maNguoiDung,
    DateTime ngayBatDauKinh,
    DateTime ngayKetThucKinh,
    DateTime ngayKetThuc,
    DateTime date,
  ) async {
    try {
      final db = await dbProvider.database;
      final check = await db.query(
        tableLuongKinh,
        where: 'thoiGian >= ? AND thoiGian <= ? AND tonTai = ?',
        whereArgs: [
          ngayBatDauKinh.millisecondsSinceEpoch,
          ngayKetThucKinh.millisecondsSinceEpoch,
          0,
        ],
      );

      //nếu mà rỗng thì sẽ cập nhật lại
      if (check.isEmpty) {
        KinhNguyet? future = await getKinhNguyet(3);
        if (future != null) {
          if (date.isBefore(future.ngayBatDau!)) {
            KinhNguyet newCurrent = createNewKinhNguyet(
              maNguoiDung: maNguoiDung,
              begin: future.ngayBatDau!.subtract(Duration(days: future.tbnkn)),
              current: future,
              tbnknNew: future.tbnkn,
              snck: future.snck,
              isUpdate: false,
            );
            await deleteFutureKinhNguyet();
            await deleteCurrentKinhNguyet();
            await db.update(
              tableKinhNguyet,
              {
                'trangThai': 2,
              },
              where: 'trangThai = ?',
              whereArgs: [3],
            );

            await insertKinhNguyet(newCurrent);
            return newCurrent;
          } else {
            await deleteKinhNguyetByStatus(3);
            return null;
          }
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  //update tbnkn và snck
  Future<bool> updateTBNKN(
    int tbnkn,
    int snck,
  ) async {
    try {
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      DateFormat formatter =
          DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
      DateTime now = DateTime.parse(formatter.format(DateTime.now()));
      KinhNguyet? current = await getKinhNguyetByStatus(1);
      if (current != null) {
        await deleteKinhNguyetByTime(now);
        List<KinhNguyet> listKinhNguyet = CalendarGenerate.generateListKN(
          maNguoiDung: maNguoiDung,
          kinhNguyet: KinhNguyet(
            ngayBatDau: current.ngayBatDau!,
            tbnkn: tbnkn,
            snck: snck,
            snct: current.snct,
            ckdn: current.ckdn,
            cknn: current.cknn,
          ),
        );
        await _luongKinhRepository.deleteListLuongKinh(
          begin: current.ngayBatDau!.add(Duration(days: snck)),
          end: current.ngayBatDau!.add(Duration(days: 7)),
        );
        await insertListKinhNguyet(maNguoiDung, listKinhNguyet, null, null);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //update lại chu kì kinh nguyệt
  Future<bool> updateCKKN(
    String maNguoiDung,
    DateTime date,
    String luongKinh,
    List<KinhNguyet> listKinhNguyet,
    List<List<DateTime>> listLuongKinh,
  ) async {
    try {
      //vị trí của ngày đã chọn nằm trong kinh nguyệt nào
      int pos = selectedKinhNguyet(
        date,
        listKinhNguyet,
      );

      //không nằm trong chu kì nào
      if (pos == -1) {
        //lấy ra chu kì đầu
        KinhNguyet first = listKinhNguyet.first;

        await deleteAllKinhNguyet(date);
        final listNewKinhNguyet = CalendarGenerate.generateListKN(
          kinhNguyet: KinhNguyet(
            ngayBatDau: date,
            tbnkn: first.tbnkn,
            snck: first.snck,
            snct: first.snct,
            ckdn: first.ckdn,
            cknn: first.cknn,
          ),
          maNguoiDung: maNguoiDung,
        );
        await insertListKinhNguyet(
          maNguoiDung,
          listNewKinhNguyet,
          luongKinh,
          null,
        );
        getCalendarDay(maNguoiDung);
      }

      //nằm trong các chu kì còn lại
      else {
        int indexCurrent = pos;
        int indexNext = pos + 1;
        KinhNguyet current = listKinhNguyet[indexCurrent];
        KinhNguyet next = listKinhNguyet[indexNext];
        int right = 1000;
        int left = 1000;
        DateTime? last;
        DateTime? first;

        if (listLuongKinh[indexNext].isNotEmpty) {
          first = listLuongKinh[indexNext].first;
          right = listLuongKinh[indexNext].last.difference(date).inDays + 1;
        }
        if (listLuongKinh[indexCurrent].isNotEmpty) {
          last = listLuongKinh[indexCurrent].last;
          left = date.difference(listLuongKinh[indexCurrent].first).inDays + 1;
        }
        if (right <= 7 || left <= 7) {
          if (left <= 7) {
            // cộng thêm ngày kinh vào bên trái
            await updateKinhNguyetById(
              createNewKinhNguyet(
                maNguoiDung: maNguoiDung,
                begin: current.ngayBatDau!,
                current: current,
                tbnknNew: current.tbnkn,
                snck: left,
                isUpdate: true,
              ),
              current.maKinhNguyet!,
            );
            await _luongKinhRepository.insertListLuongKinh(
              maNguoiDung: maNguoiDung,
              begin: last!.add(Duration(days: 1)),
              end: date,
              luongKinh: luongKinh,
            );
            getCalendarDay(maNguoiDung);
          } else if (right <= 7) {
            // cộng thêm ngày kinh vào bên phải
            //ngày bắt đầu của chu kì tiếp
            DateTime firstDayNext = date;
            //ngày kết thúc của chu kì hiện tại
            DateTime lastDayCurrent = date.subtract(Duration(days: 1));
            //cập nhật chu kì hiện tại

            await updateKinhNguyetById(
              createNewKinhNguyet(
                maNguoiDung: maNguoiDung,
                begin: current.ngayBatDau!,
                current: current,
                tbnknNew:
                    lastDayCurrent.difference(current.ngayBatDau!).inDays + 1,
                snck: current.snck,
                isUpdate: true,
              ),
              current.maKinhNguyet!,
            );

            //cập nhật chu kì tiếp
            await updateKinhNguyetById(
              createNewKinhNguyet(
                maNguoiDung: maNguoiDung,
                begin: firstDayNext,
                current: next,
                tbnknNew: next.ngayKetThuc!.difference(firstDayNext).inDays + 1,
                snck: right,
                isUpdate: true,
              ),
              next.maKinhNguyet!,
            );

            await _luongKinhRepository.insertListLuongKinh(
              maNguoiDung: maNguoiDung,
              begin: date,
              end: first!.subtract(Duration(days: 1)),
              luongKinh: luongKinh,
            );
            getCalendarDay(maNguoiDung);
          }
        } else {
          List<KinhNguyet> listKinhNguyet1 = listKinhNguyet;
          if (checkTheSameDay(date, current.ngayBatDauKinh!)) {
            await _luongKinhRepository.insertListLuongKinh(
              maNguoiDung: maNguoiDung,
              begin: date,
              end: date,
              luongKinh: luongKinh,
            );
          } else {
            // đổi chu kì kinh nguyệt
            //ngày bắt đầu của chu kì tiếp
            DateTime firstDayNext = date;
            //ngày kết thúc của chu kì hiện tại
            DateTime lastDayCurrent = date.subtract(Duration(days: 1));
            //trung bình ngày có kinh
            int tbnknNew =
                lastDayCurrent.difference(current.ngayBatDau!).inDays + 1;
            if (indexCurrent != 0) {
              // nếu mà ngày sửa nằm trong ngày kinh thì mới lấy của chu kì trước
              if (current.trangThai == 1 &&
                  checkBetween(
                      date, current.ngayBatDauKinh!, current.ngayKetThuc!)) {
                current = listKinhNguyet1[indexCurrent - 1];
              }
              tbnknNew =
                  lastDayCurrent.difference(current.ngayBatDau!).inDays + 1;

              //cập nhật chu kì hiện tại
              await updateKinhNguyetById(
                createNewKinhNguyet(
                  maNguoiDung: maNguoiDung,
                  begin: current.ngayBatDau!,
                  current: current,
                  tbnknNew: tbnknNew,
                  snck: current.snck,
                  isUpdate: true,
                ),
                current.maKinhNguyet!,
              );
            } else {
              await updateKinhNguyetById(
                createNewKinhNguyet(
                  maNguoiDung: maNguoiDung,
                  begin: current.ngayBatDau!,
                  current: current,
                  tbnknNew: tbnknNew,
                  snck: current.snck,
                  isUpdate: true,
                ),
                current.maKinhNguyet!,
              );
            }

            await deleteKinhNguyetByTime(firstDayNext);
            List<KinhNguyet> listKinhNguyet = CalendarGenerate.generateListKN(
              maNguoiDung: maNguoiDung,
              kinhNguyet: KinhNguyet(
                ngayBatDau: firstDayNext,
                tbnkn: (next.tbnkn * 2 + tbnknNew) ~/ 3,
                snck: next.snck,
                snct: next.snct,
                ckdn: next.ckdn,
                cknn: next.cknn,
              ),
            );
            await insertListKinhNguyet(
                maNguoiDung, listKinhNguyet, luongKinh, null);
            await _luongKinhRepository.insertListLuongKinh(
              maNguoiDung: maNguoiDung,
              begin: date,
              end: date,
              luongKinh: luongKinh,
            );
          }
          getCalendarDay(maNguoiDung);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //delete and update CKKN
  Future<bool> deteleCKKN(
    String maNguoiDung,
    int maLuongKinh,
    DateTime date,
    List<KinhNguyet> listKinhNguyet,
    List<List<DateTime>> listLuongKinh,
  ) async {
    try {
      int pos = selectedKinhNguyet(
        date,
        listKinhNguyet,
      ); //vị trí của ngày đã chọn nằm trong kinh nguyệt nào

      int indexCurrent = pos;
      KinhNguyet current = listKinhNguyet[indexCurrent];

      if (checkTheSameDay(listLuongKinh[indexCurrent].first, date)) {
        if (listLuongKinh[indexCurrent].length > 1) {
          //cập nhật chu kì hiện tại
          await updateKinhNguyetById(
            createNewKinhNguyet(
              maNguoiDung: maNguoiDung,
              begin: current.ngayBatDau!.add(Duration(days: 1)),
              current: current,
              tbnknNew: current.tbnkn - 1,
              snck: current.snck,
              isUpdate: true,
            ),
            current.maKinhNguyet!,
          );

          if (pos > 0) {
            int indexLast = pos - 1;
            KinhNguyet last = listKinhNguyet[indexLast];
            //cập nhật chu kì trước
            await updateKinhNguyetById(
              createNewKinhNguyet(
                maNguoiDung: maNguoiDung,
                begin: last.ngayBatDau!,
                current: last,
                tbnknNew: last.tbnkn + 1,
                snck: last.snck,
                isUpdate: true,
              ),
              last.maKinhNguyet!,
            );
          }

          await _luongKinhRepository.deleteListLuongKinh(
            begin: date,
            end: date,
          );
          getCalendarDay(maNguoiDung);
          return true;
        } else if (current.trangThai == 1) {
          await _luongKinhRepository.deleteListLuongKinh(
              begin: date, end: date);
          getCalendarDay(maNguoiDung);
          return true;
        }
        return false;
      } else if (listLuongKinh[indexCurrent].contains(date)) {
        await _luongKinhRepository.deleteListLuongKinh(
            begin: date, end: listLuongKinh[indexCurrent].last);
      }
      getCalendarDay(maNguoiDung);

      return true;
    } catch (e) {
      return false;
    }
  }

  //reset lại chu kì kinh nguyệt sau khi test đạt đỉnh
  Future<int> resetCKKNAfterTest(
    int tbnknNew,
  ) async {
    try {
      DateTime now = DateTime.parse(
          DateFormat('yyyy-MM-dd 00:00:00.000').format(DateTime.now()));
      KinhNguyet? current = await getKinhNguyet(1);

      if (current != null) {
        int rangeDay = now.difference(current.ngayBatDau!).inDays + 1;
        String maNguoiDung = await SharedPreferencesService.getId() ?? '';
        await deleteKinhNguyetByTime(now);
        //nếu ngày test đạt đỉnh nằm trong 7 ngày kinh thì mặc định chu kì hiện tại là 21 ngày
        if (rangeDay <= 7) {
          final listNewKinhNguyet = CalendarGenerate.generateListKN(
            kinhNguyet: KinhNguyet(
              ngayBatDau: current.ngayBatDau!,
              tbnkn: tbnknNew,
              snck: current.snck,
              snct: current.snct,
              ckdn: 21,
              cknn: 21,
            ),
            maNguoiDung: maNguoiDung,
          );
          await insertListKinhNguyet(
              maNguoiDung, listNewKinhNguyet, null, null);
          await _luongKinhRepository.insertListLuongKinh(
            maNguoiDung: maNguoiDung,
            begin: current.ngayBatDau!,
            end: now,
            luongKinh: 'Trung bình',
          );
        } else {
          int initDay = 13;
          if (current.tbnkn > 28) {
            initDay = current.tbnkn - 15;
          }
          tbnknNew = rangeDay + initDay;
          int tb = tbnknNew;
          if (tb > 44) {
            tb = 44;
          }
          final listNewKinhNguyet = CalendarGenerate.generateListKN(
            kinhNguyet: KinhNguyet(
              ngayBatDau: current.ngayBatDau!,
              tbnkn: tb,
              snck: current.snck,
              snct: current.snct,
              ckdn: tb,
              cknn: tb,
            ),
            maNguoiDung: maNguoiDung,
          );
          await insertListKinhNguyet(
              maNguoiDung, listNewKinhNguyet, null, null);
        }
        await NguoiDungRepository().updateTrangThai(trangThai: 0);
      }
      return tbnknNew;
    } catch (e) {
      throw e;
    }
  }

  Stream<CalendarDay> allListKN() => _streamDayController.stream;
}
