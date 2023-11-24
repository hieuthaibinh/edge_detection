import 'package:flutter_ovumb_app_version1/data/models/calendar/ckkn_display.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:intl/intl.dart';

// convert ngày tháng năm phân cách bởi dấu /
String convertDateTime(DateTime dateTime) =>
    '${dateTime.day}/${dateTime.month}/${dateTime.year}';

// convert ngày tháng năm phân cách bởi dấu .
String convertDateTimeChart(DateTime dateTime) =>
    '${dateTime.day}.${dateTime.month}.${dateTime.year}';

//lấy ngày tháng hiện tại
int getCurrentWeekday() => DateTime.now().weekday;
String getCurrentDay() => DateTime.now().day.toString();
String getCurrentMonth() => DateTime.now().month.toString();
String getCurrentYear() => DateTime.now().year.toString();

// chuyển thứ
String getDateTime() {
  String weekDay = 'Thứ 2';
  switch (getCurrentWeekday()) {
    case 1:
      weekDay = 'Thứ 2';
      break;
    case 2:
      weekDay = 'Thứ 3';
      break;
    case 3:
      weekDay = 'Thứ 4';
      break;
    case 4:
      weekDay = 'Thứ 5';
      break;
    case 5:
      weekDay = 'Thứ 6';
      break;
    case 6:
      weekDay = 'Thứ 7';
      break;
    case 7:
      weekDay = 'Chủ nhật';
      break;
    default:
      weekDay;
  }
  return '$weekDay, ngày ${getCurrentDay()} tháng ${getCurrentMonth()} năm ${getCurrentYear()}';
}

//kiểm tra xem có là ngày hôm nay không
bool checkToday(DateTime other) {
  final datetime = DateTime.now();
  if (other.day == datetime.day &&
      other.month == datetime.month &&
      other.year == datetime.year) {
    return true;
  }
  return false;
}

// kiểm tra ngày có giống nhau không
bool checkTheSameDay(DateTime other, DateTime other1) {
  if (other.day == other1.day &&
      other.month == other1.month &&
      other.year == other1.year) {
    return true;
  }
  return false;
}

//kiểm tra xem có là ngày rụng trứng không
bool checkMark(DateTime other, List<DateTime> listData) {
  for (DateTime datetime in listData) {
    if (other.day == datetime.day &&
        other.month == datetime.month &&
        other.year == datetime.year) {
      return true;
    }
  }
  return false;
}

//kiểm tra xem có là ngày rụng trứng không
bool checkBetween(DateTime date, DateTime begin, DateTime end) {
  DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  date = DateTime.parse(formatter.format(date));
  if (date.isAfter(begin) && date.isBefore(end) ||
      date.isAtSameMomentAs(begin) ||
      date.isAtSameMomentAs(end)) {
    return true;
  }
  return false;
}

//kiểm tra xem ngày hôm đấy có dữ liệu không
bool checkData(DateTime date, List<LuongKinh> listLuongKinh) {
  for (LuongKinh nhatKy in listLuongKinh) {
    if (checkTheSameDay(date, nhatKy.thoiGian)) {
      return true;
    }
  }
  return false;
}

//các tiêu đề trong phần percent
String getSubTextKinh(String day) =>
    'Bắt đầu sau $day ngày nữa. Hãy ghi nhớ để có sự chuẩn bị tốt nhất!';
String getSubTextTrung(String day) =>
    'Bắt đầu sau $day ngày nữa. Chuẩn bị canh trứng, tăng cơ hội thụ thai!';
String getSubTextTrungVTN(String day) =>
    'Bắt đầu sau $day ngày nữa. Không nên quan hệ vào những ngày này';
String getSubTextAnToan(String day, int x) =>
    'Bắt đầu sau $day ngày nữa. Chu kỳ này của bạn có $x ngày an toàn!';

List<String> titleTextKinh = ['Kỳ kinh nguyệt mới', 'Kỳ kinh mới bắt đầu'];
List<String> titleTextTrung = ['Ngày rụng trứng', 'Cửa sổ thụ thai'];

// chuyển thứ thành T2
String convertWeekDay(int weekDay) {
  switch (weekDay) {
    case 1:
      return 'T2';
    case 2:
      return 'T3';
    case 3:
      return 'T4';
    case 4:
      return 'T5';
    case 5:
      return 'T6';
    case 6:
      return 'T7';
    case 7:
      return 'CN';
    default:
      return 'T2';
  }
}

// lấy tuổi
int getAge(int namsinh) {
  return DateTime.now().year.toInt() - namsinh;
}

// lấy ra dữ liệu để hiện lên màn mình
CKKNDisplay getCKKNDisplay(
  KinhNguyet current,
  KinhNguyet future,
  int phase,
) {
  // lấy số ngày còn lại bắt đầu có kinh và có trứng
  int soNgayConLaiKinh = getNgayKinhConLai(current, future);
  int soNgayConLaiTrung = getNgayTrungConLai(current, future);

  // tiêu đề phụ của percent
  List<String> subTextKinh = [
    getSubTextKinh(soNgayConLaiKinh.toString()),
    'Hãy ăn uống đầy đủ'
  ];
  List<String> subTextTrung = [
    phase == 1
        ? getSubTextTrung(soNgayConLaiTrung.toString())
        : getSubTextTrungVTN(soNgayConLaiTrung.toString()),
    phase == 1
        ? 'Hãy test que để xác định thời điểm rụng trứng'
        : 'Không nên quan hệ vào những ngày này',
  ];

  // phần trăm của ngày
  double kinhPercent = (current.tbnkn - soNgayConLaiKinh) / current.tbnkn;
  double trungPercent = (current.tbnkn - soNgayConLaiTrung) / current.tbnkn;

  CKKNDisplay ckknDisplay = CKKNDisplay(
    soNgayConLaiKinh,
    soNgayConLaiTrung,
    titleTextKinh,
    titleTextTrung,
    subTextKinh,
    subTextTrung,
    kinhPercent,
    trungPercent,
  );
  return ckknDisplay;
}

// lấy ra dữ liệu để hiện lên màn mình
CKKNDisplay getCKKNPhase1Display(
  KinhNguyet current,
  KinhNguyet future,
  List<DateTime> listAnToanTuyetDoi,
) {
  DateFormat formatter =
      DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
  DateTime now = DateTime.parse(formatter.format(DateTime.now()));
  // lấy số ngày còn lại bắt đầu có kinh và có trứng
  int soNgayConLaiKinh = getNgayKinhConLai(current, future);

  int ngayConLai = 0;
  List<String> subTextAnToan;
  List<String> titleTextAnToan;
  if (listAnToanTuyetDoi.isNotEmpty) {
    ngayConLai = listAnToanTuyetDoi.first.difference(now).inDays;
    if (ngayConLai <= 0) {
      ngayConLai = 0;
    }
    subTextAnToan = [
      getSubTextAnToan(ngayConLai.toString(), listAnToanTuyetDoi.length),
      'Có thể quan hệ an toàn, sử dụng thêm bao cao su để đảm bảo'
    ];
    titleTextAnToan = ['Ngày an toàn', 'Giai đoạn an toàn'];
  } else {
    subTextAnToan = [
      'Tính ngày an toàn',
      'Hãy test que để xác định ngày quan hệ an toàn'
    ];
    titleTextAnToan = ['Tính ngày an toàn', 'Tính ngày an toàn'];
  }

  // tiêu đề phụ của percent
  List<String> subTextKinh = [
    getSubTextKinh(soNgayConLaiKinh.toString()),
    'Hãy ăn uống đầy đủ'
  ];

  // phần trăm của ngày
  double kinhPercent = (current.tbnkn - soNgayConLaiKinh) / current.tbnkn;
  double trungPercent = (current.tbnkn - ngayConLai) / current.tbnkn;

  CKKNDisplay ckknDisplay = CKKNDisplay(
    soNgayConLaiKinh,
    ngayConLai,
    titleTextKinh,
    titleTextAnToan,
    subTextKinh,
    subTextAnToan,
    kinhPercent,
    trungPercent,
  );
  return ckknDisplay;
}

// lấy ra ngày kinh còn lại
int getNgayKinhConLai(KinhNguyet current, KinhNguyet fututre) {
  DateFormat formatter =
      DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
  DateTime now = DateTime.parse(formatter.format(DateTime.now()));

  if (checkBetween(now, current.ngayBatDauKinh!, current.ngayKetThucKinh!)) {
    return 0;
  } else {
    return fututre.ngayBatDauKinh!.difference(now).inDays;
  }
}

// lấy ra ngày trứng còn lại
int getNgayTrungConLai(KinhNguyet current, KinhNguyet fututre) {
  DateFormat formatter =
      DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
  DateTime now = DateTime.parse(formatter.format(DateTime.now()));
  if (checkBetween(now, current.ngayBatDauTrung!, current.ngayKetThucTrung!)) {
    return 0;
  } else {
    if (checkBetween(now, current.ngayBatDauKinh!, current.ngayBatDauTrung!)) {
      return current.ngayBatDauTrung!.difference(now).inDays;
    }
    return fututre.ngayBatDauTrung!.difference(now).inDays;
  }
}

// lấy tất cả các tháng và năm nằm trước trong và sau chu kì kinh nguyệt
List<Map<String, DateTime>> getMonthDateRange(
  DateTime firstDay,
  DateTime lastDay,
) {
  List<Map<String, DateTime>> monthDateRanges = [];
  DateTime startDate = DateTime(firstDay.year, firstDay.month - 1, 1)
      .subtract(Duration(days: 1));
  DateTime endDate = DateTime(lastDay.year, lastDay.month + 2, 1);
  for (DateTime date = startDate;
      date.isBefore(endDate);
      date = DateTime(date.year, date.month + 1, 1)) {
    DateTime firstDayOfMonth = DateTime.utc(date.year, date.month, 1);
    DateTime lastDayOfMonth = DateTime.utc(date.year, date.month + 1, 0);
    monthDateRanges.add({
      'start': firstDayOfMonth,
      'end': lastDayOfMonth,
    });
  }
  return monthDateRanges;
}

//convert datetime to Tháng MM Năm YYYY
String convertMonthYear(DateTime date) {
  return 'Tháng ${date.month} Năm ${date.year}';
}

//format date time
DateTime formatDateTime(DateTime dateTime) {
  DateFormat formatter =
      DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
  DateTime selecteDay = DateTime.parse(formatter.format(dateTime));
  return selecteDay;
}
