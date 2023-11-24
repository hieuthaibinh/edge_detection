import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class ChoanChart {
  String _buildDate(DateTime date) {
    return '${date.day}/${date.month}';
  }

  // xu li data de load bieu do
  List<ChartDataChoAn> handleDataChoAn(
      List<ChoAn> listChoAn, ChoAnEnum choAnEnum) {
    List<ChartDataChoAn> chartDataChoAn1 = [];

    Map<String, num> map1 = {};

    for (int i = 0; i < listChoAn.length; i++) {
      ChoAn choAn = listChoAn[i];
      String day = _buildDate(choAn.ngayTao!);
      if (choAn.maLoaiChoAn == 2 || choAn.maLoaiChoAn == 3) {
        map1[day] = map1[day] != null
            ? map1[day]! + choAn.trongLuong
            : choAn.trongLuong;
      } else if (choAn.maLoaiChoAn == 1) {
        map1[day] = map1[day] != null
            ? map1[day]! + choAn.trongLuong
            : choAn.trongLuong;
      } else if (choAn.maLoaiChoAn == 4) {
        map1[day] = map1[day] != null
            ? map1[day]! + choAn.trongLuong
            : choAn.trongLuong;
      }
    }
    map1.forEach((key, value) {
      chartDataChoAn1.add(ChartDataChoAn(
        key,
        value,
        getColorChartChoAn(choAnEnum)[0],
      ));
    });

    return chartDataChoAn1;
  }

  // xu li data de load bieu do
  List<ChartDataChoAn> handleDataHutSua(List<HutSua> listHutSua) {
    List<ChartDataChoAn> chartDataChoAn1 = [];

    Map<String, num> map1 = {};
    for (int i = 0; i < listHutSua.length; i++) {
      HutSua hutSua = listHutSua[i];
      String day = _buildDate(hutSua.ngayTao!);
      num vuTrai = hutSua.vuTrai ?? 0;
      num vuPhai = hutSua.vuPhai ?? 0;
      num trongLuong = vuTrai + vuPhai;

      map1[day] = map1[day] != null ? map1[day]! + trongLuong : trongLuong;
    }

    map1.forEach((key, value) {
      chartDataChoAn1.add(ChartDataChoAn(key, value, rose400));
    });

    return chartDataChoAn1;
  }

  // xu li data de load bieu do
  List<ChartDataChoAn> handleDataHutSuaByDay(List<HutSua> listHutSua) {
    List<ChartDataChoAn> chartDataChoAn1 = [];
    int index = listHutSua.length;
    for (int i = 0; i < listHutSua.length; i++) {
      HutSua hutSua = listHutSua[i];
      num vuTrai = hutSua.vuTrai ?? 0;
      num vuPhai = hutSua.vuPhai ?? 0;
      num trongLuong = vuTrai + vuPhai;
      chartDataChoAn1.add(ChartDataChoAn(index.toString(), trongLuong, rose400,
          date: listHutSua[i].thoiGian));
      index--;
    }
    return chartDataChoAn1.reversed.toList();
  }

  //tinh tong
  int? getTotal(List<ChoAn> choAn, ChoAnEnum choAnEnum) {
    if (choAn.isEmpty) return null;
    double total = 0;
    choAn.forEach((e) {
      total += e.trongLuong;
    });
    return total.round();
  }

  //tinh trung binh
  int? getAverage(List<ChoAn> choAn, ChoAnEnum choAnEnum) {
    if (choAn.isEmpty) return null;
    double total = 0;
    choAn.forEach((e) {
      total += e.trongLuong;
    });
    return (total / choAn.length).round();
  }

  //tinh tong
  int? getTotalHutSua(List<HutSua> hutSua) {
    if (hutSua.isEmpty) return null;
    double total = 0;
    hutSua.forEach((e) {
      total += (e.vuPhai ?? 0) + (e.vuTrai ?? 0);
    });
    return total.round();
  }

  //tinh trung binh
  int? getAverageHutSua(List<HutSua> hutSua) {
    return getTotalHutSua(hutSua) != null
        ? (getTotalHutSua(hutSua)! / hutSua.length).round()
        : null;
  }
}
