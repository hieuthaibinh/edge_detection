import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/nhatky_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/calender_handle.dart';
import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_tra_loi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nguoidung/nguoidung_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nhatky/nhatky_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/luongkinh_remove_dialog.dart';
import 'package:intl/intl.dart';

//class để xử lí data trong nhật ký
class NhatKyLogic {
  KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
  NhatKyRepository _nhatKyRepository = NhatKyRepository();

  //kiểm tra xem có thể update lại được chu kì kinh nguyệt mới không
  bool canUpdateCKKN({
    required CalendarDay calendarDay,
    required DateTime selectedDay,
  }) {
    DateFormat formatter =
        DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
    DateTime now = DateTime.parse(formatter.format(DateTime.now()));

    //lấy ra list các list lượng kinh
    List<List<DateTime>> listLuongKinh = [];
    List<DateTime> times =
        calendarDay.listLuongKinh.map((e) => e.thoiGian).toList();
    for (int i = 0; i < calendarDay.listKinhNguyet.length; i++) {
      List<DateTime> tmp = [];
      DateTime begin = calendarDay.listKinhNguyet[i].ngayBatDauKinh!;
      DateTime end = calendarDay.listKinhNguyet[i].ngayKetThucKinh!;
      while (!end.isBefore(begin)) {
        if (times.contains(begin)) {
          tmp.add(begin);
        }
        begin = begin.add(Duration(days: 1));
      }
      listLuongKinh.add(tmp);
    }

    for (int i = 0; i < calendarDay.listKinhNguyet.length - 1; i++) {
      //kiểm tra xem ngày chỉnh sửa có trước ngày chu kì đầu tiên không và chỉ cho chỉnh trước ngày hiện tại 4 tháng
      if (selectedDay.isBefore(calendarDay.listKinhNguyet[0].ngayBatDau!) &&
          now.difference(selectedDay).inDays < 120) {
        return true;
      }

      if (calendarDay.listKinh.contains(selectedDay)) {
        return true;
      }

      int indexCurrent = i;
      int indexNext = i + 1;
      KinhNguyet current = calendarDay.listKinhNguyet[indexCurrent];
      //KinhNguyet next = calendarDay.listKinhNguyet[indexNext];

      if (checkBetween(
          selectedDay, current.ngayBatDau!, current.ngayKetThuc!)) {
        /* 
        TH1: ngày đầu của chu kì hiện tại (current) đến ngày chọn có lớn hơn 21 không
        TH2: ngày lượng kinh cuối của chu kì tiếp (next) đến ngày chọn có nhỏ hơn 7 không
        */
        int checkCurrent =
            selectedDay.difference(current.ngayBatDauKinh!).inDays + 1;
        int checkNext = 7;

        if (listLuongKinh[indexCurrent].isEmpty) {
          KinhNguyet last = calendarDay.listKinhNguyet[indexCurrent - 1];
          checkCurrent =
              selectedDay.difference(last.ngayBatDauKinh!).inDays + 1;
        }
        if (listLuongKinh[indexNext].isNotEmpty) {
          checkNext =
              listLuongKinh[indexNext].last.difference(selectedDay).inDays + 1;
        }
        if (checkCurrent <= 7 || (checkCurrent > 21 && checkNext <= 7)) {
          return true;
        }
      }
    }
    return false;
  }

  // //kiểm tra xem ngày đó có thể chỉnh sửa lượng kinh nguyệt của ngày hôm đó
  // bool canInsertKinh({
  //   required CalendarDay calendarDay,
  //   required DateTime selectedDay,
  // }) {
  //   DateFormat formatter =
  //       DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
  //   DateTime day = DateTime.parse(formatter.format(selectedDay));
  //   for (int i = 0; i < calendarDay.listKinhNguyet.length; i++) {
  //     if (checkBetween(day, calendarDay.listKinhNguyet[i].ngayBatDauKinh!,
  //         calendarDay.listKinhNguyet[i].ngayKetThucKinh!)) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // lưu dữ liệu vào local db
  Future<void> saveNhatKy({
    required BuildContext context,
    required bool connected,
    required String maNguoiDung,
    required DateTime date,
    required List<CauHoi> listCauHoi,
    required List<CauTraLoi> listCauTraLoi,
    required List<DataModel> question,
    required DataModel questionLuongKinh,
    required LuongKinh? luongKinh,
    required CalendarDay listCalendar,
    required String controller1,
    required String controller2,
    required bool canUpdateCKKN,
  }) async {
    bool checkList = false;
    List<String> answers = [];

    // lấy các câu trả lời đã pick
    for (int index = 0; index < listCauHoi.length; index++) {
      String res = '';
      if (question[index].subtitle.isNotEmpty) {
        if (question[index].type == NhatKyEnum.radiobutton) {
          res = question[index].subtitle.last; //radiobutton luôn lấy thằng cuối
        } else if (question[index].type == NhatKyEnum.checkbox) {
          res = joinAnswer(question[index].subtitle); //checkbox lấy hết
        } else {
          res = controller1 + '.' + controller2; //nhiệt độ thì cộng
        }
        checkList = true;
      }
      answers.add(res);
    }

    //lấy ra list các list lượng kinh
    List<List<DateTime>> listLuongKinh = [];
    List<DateTime> times =
        listCalendar.listLuongKinh.map((e) => e.thoiGian).toList();
    for (int i = 0; i < listCalendar.listKinhNguyet.length; i++) {
      List<DateTime> tmp = [];
      DateTime begin = listCalendar.listKinhNguyet[i].ngayBatDauKinh!;
      DateTime end = listCalendar.listKinhNguyet[i].ngayKetThucKinh!;
      while (!end.isBefore(begin)) {
        if (times.contains(begin)) {
          tmp.add(begin);
        }
        begin = begin.add(Duration(days: 1));
      }
      listLuongKinh.add(tmp);
    }

    //nếu người dùng muốn xóa lượng kinh
    if (questionLuongKinh.subtitle.isNotEmpty) {
      if (luongKinh == null) {
        await _kinhNguyetRepository.updateCKKN(
          maNguoiDung: maNguoiDung,
          date: date,
          luongKinh: questionLuongKinh.subtitle.last,
          listKinhNguyet: listCalendar.listKinhNguyet,
          listLuongKinh: listLuongKinh,
        );
      } else {
        await _nhatKyRepository.insertLuongKinh(
          maNguoiDung: maNguoiDung,
          date: date,
          luongKinh: questionLuongKinh.subtitle.last,
        );
        _kinhNguyetRepository.getCalendarDay(maNguoiDung);
      }
      await NguoiDungRepository().updateTrangThai(trangThai: 0);
    } else if (luongKinh != null) {
      final check = await _kinhNguyetRepository.deteleCKKN(
        maNguoiDung: maNguoiDung,
        maLuongKinh: luongKinh.maLuongKinh,
        date: date,
        listKinhNguyet: listCalendar.listKinhNguyet,
        listLuongKinh: listLuongKinh,
      );
      if (!check) {
        await luongkinhRemoveDialog(context);
      } else {
        await NguoiDungRepository().updateTrangThai(trangThai: 0);
      }
    }

    if (checkList) {
      await _nhatKyRepository.updateListCauTraLoi(
        maNguoiDung: maNguoiDung,
        date: date,
        listCauTraLoi: answers,
      );
      await NguoiDungRepository().updateTrangThai(trangThai: 0);
      _kinhNguyetRepository.getCalendarDay(maNguoiDung);
    }
    Navigator.of(context).pop();
  }
}
