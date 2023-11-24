import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/calendar.dart';
import 'package:intl/intl.dart';

class CalendarGenerate {
  //generate tất cả các chu kì kinh nguyệt
  static List<KinhNguyet> generateListKN({
    required KinhNguyet kinhNguyet,
    required String maNguoiDung,
  }) {
    DateTime begin = kinhNguyet.ngayBatDau!;
    int tbnkn = kinhNguyet.tbnkn;
    int snck = kinhNguyet.snck;
    int snct = kinhNguyet.snct;
    int ckdn = kinhNguyet.ckdn;
    int cknn = kinhNguyet.cknn;
    List<KinhNguyet> listKN = [];

    // generate kinh nguyệt trước đó và hiện tại
    bool status = false;
    while (!status) {
      DateTime end = begin.add(Duration(days: tbnkn - 1));
      int nct = testDay[tbnkn]! - 1;
      if (nct < snck) {
        nct = snck;
      }

      DateTime beginK = begin;
      DateTime endK = beginK.add(Duration(days: snck - 1));
      DateTime beginT = begin.add(Duration(days: nct));
      DateTime endT = beginT.add(Duration(days: 6));
      DateFormat formatter =
          DateFormat('yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
      DateTime now = DateTime.parse(formatter.format(DateTime.now()));
      status = now.isBefore(end) || now.isAtSameMomentAs(end);
      listKN.add(KinhNguyet(
        maNguoiDung: maNguoiDung,
        tbnkn: tbnkn,
        snck: snck,
        snct: snct,
        ckdn: ckdn,
        cknn: cknn,
        ngayBatDau: begin,
        ngayKetThuc: end,
        ngayBatDauKinh: beginK,
        ngayKetThucKinh: endK,
        ngayBatDauTrung: beginT,
        ngayKetThucTrung: endT,
        trangThai: status ? 1 : 0,
      ));
      begin = end.add(Duration(days: 1));
    }

    // generate kinh nguyệt dự đoán
    int nct = testDay[tbnkn]! - 1;
    if (nct < snck) {
      nct = snck;
    }
    DateTime end = begin.add(Duration(days: tbnkn - 1));
    DateTime beginK = begin;
    DateTime endK = beginK.add(Duration(days: snck - 1));
    DateTime beginT = begin.add(Duration(days: nct));
    DateTime endT = beginT.add(Duration(days: 6));
    listKN.add(
      KinhNguyet(
        maNguoiDung: maNguoiDung,
        tbnkn: tbnkn,
        snck: snck,
        snct: snct,
        ckdn: ckdn,
        cknn: cknn,
        ngayBatDau: begin,
        ngayKetThuc: end,
        ngayBatDauKinh: beginK,
        ngayKetThucKinh: endK,
        ngayBatDauTrung: beginT,
        ngayKetThucTrung: endT,
        trangThai: 2,
      ),
    );
    return listKN;
  }

  //generate tất cả các chu kì kinh nguyệt trong tương lai
  static KinhNguyet generateKinhNguyet({
    required KinhNguyet kinhNguyet,
    required String maNguoiDung,
  }) {
    DateTime begin = DateTime.now();
    int tbnkn = kinhNguyet.tbnkn;
    int snck = kinhNguyet.snck;
    int snct = kinhNguyet.snct;
    int ckdn = kinhNguyet.ckdn;
    int cknn = kinhNguyet.cknn;

    DateTime end = begin.add(Duration(days: tbnkn - 1));

    int nct = testDay[tbnkn]! - 1;
    if (nct < snck) {
      nct = snck;
    }

    DateTime beginK = begin;
    DateTime endK = beginK.add(Duration(days: snck - 1));
    DateTime beginT = begin.add(Duration(days: nct));
    DateTime endT = beginT.add(Duration(days: 6));
    return KinhNguyet(
      maNguoiDung: maNguoiDung,
      tbnkn: tbnkn,
      snck: snck,
      snct: snct,
      ckdn: ckdn,
      cknn: cknn,
      ngayBatDau: begin,
      ngayKetThuc: end,
      ngayBatDauKinh: beginK,
      ngayKetThucKinh: endK,
      ngayBatDauTrung: beginT,
      ngayKetThucTrung: endT,
      trangThai: 0,
    );
  }

  static KinhNguyet generateKinhNguyetUpdate({
    required KinhNguyet kinhNguyet,
    required String maNguoiDung,
    required int tbnkn,
    required int snck,
  }) {
    DateTime begin = kinhNguyet.ngayBatDau!;
    int snct = kinhNguyet.snct;
    int ckdn = kinhNguyet.ckdn;
    int cknn = kinhNguyet.cknn;

    DateTime end = begin.add(Duration(days: tbnkn - 1));

    int nct = testDay[tbnkn]! - 1;
    if (nct < snck) {
      nct = snck;
    }

    DateTime beginK = begin;
    DateTime endK = beginK.add(Duration(days: snck - 1));
    DateTime beginT = begin.add(Duration(days: nct));
    DateTime endT = beginT.add(Duration(days: 6));
    return KinhNguyet(
      maNguoiDung: maNguoiDung,
      tbnkn: tbnkn,
      snck: snck,
      snct: snct,
      ckdn: ckdn,
      cknn: cknn,
      ngayBatDau: begin,
      ngayKetThuc: end,
      ngayBatDauKinh: beginK,
      ngayKetThucKinh: endK,
      ngayBatDauTrung: beginT,
      ngayKetThucTrung: endT,
      trangThai: 0,
    );
  }
}
