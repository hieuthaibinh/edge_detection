import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';

List<List<String>> listBMIGai = [
  "11.1 12.2 13.3 14.6 16.1".split(' '),
  "12.0 13.2 14.6 16.0 17.5".split(' '),
  "13.0 14.3 15.8 17.3 19.0".split(' '),
  "13.6 14.9 16.4 17.9 19.7".split(' '),
  "13.9 15.2 16.7 18.3 20.0".split(' '),
  "14.1 15.4 16.8 18.4 20.2".split(' '),
  "14.1 15.5 16.9 18.5 20.3".split(' '),
  "14.2 15.5 16.9 18.5 20.3".split(' '),
  "14.1 15.4 16.8 18.4 20.2".split(' '),
  "14.1 15.3 16.7 18.3 20.1".split(' '),
  "14.0 15.2 16.6 18.2 19.9".split(' '),
  "13.9 15.1 16.5 18.0 19.8".split(' '),
  "13.8 15.0 16.4 17.9 19.6".split(' '),
  "13.7 14.9 16.2 17.7 19.5".split(' '),
  "13.6 14.8 16.1 17.6 19.3".split(' '),
  "13.5 14.7 16.0 17.5 19.2".split(' '),
  "13.5 14.6 15.9 17.4 19.1".split(' '),
  "13.4 14.5 15.8 17.3 18.9".split(' '),
  "13.3 14.4 15.7 17.2 18.8".split(' '),
  "13.3 14.4 15.7 17.1 18.8".split(' '),
  "13.2 14.3 15.6 17.0 18.7".split(' '),
  "13.2 14.3 15.5 17.0 18.6".split(' '),
  "13.1 14.2 15.5 16.9 18.5".split(' '),
  "13.1 14.2 15.4 16.9 18.5".split(' '),
  "13.1 14.2 15.4 16.8 18.4".split(' '),
  "13.3 14.4 15.7 17.1 18.7".split(' '),
  "13.3 14.4 15.7 17.1 18.7".split(' '),
  "13.3 14.4 15.6 17.0 18.7".split(' '),
  "13.3 14.4 15.6 17.0 18.6".split(' '),
  "13.3 14.3 15.6 17.0 18.6".split(' '),
  "13.2 14.3 15.6 17.0 18.6".split(' '),
  "13.2 14.3 15.5 16.9 18.5".split(' '),
  "13.2 14.3 15.5 16.9 18.5".split(' '),
  "13.2 14.3 15.5 16.9 18.5".split(' '),
  "13.1 14.2 15.5 16.9 18.5".split(' '),
  "13.1 14.2 15.4 16.8 18.5".split(' '),
  "13.1 14.2 15.4 16.8 18.4".split(' '),
  "13.1 14.2 15.4 16.8 18.4".split(' '),
];

List<List<String>> listBMITrai = [
  "11.1 12.2 13.4 14.8 16.3".split(' '),
  "12.4 13.6 14.9 16.3 17.8".split(' '),
  "13.7 15.0 16.3 17.8 19.4".split(' '),
  "14.3 15.5 16.9 18.4 20.0".split(' '),
  "14.5 15.8 17.2 18.7 20.3".split(' '),
  "14.7 15.9 17.3 18.8 20.5".split(' '),
  "14.7 16.0 17.3 18.8 20.5".split(' '),
  "14.8 16.0 17.3 18.8 20.5".split(' '),
  "14.7 15.9 17.3 18.7 20.4".split(' '),
  "14.7 15.8 17.2 18.6 20.3".split(' '),
  "14.6 15.7 17.0 18.5 20.1".split(' '),
  "14.5 15.6 16.9 18.4 20.0".split(' '),
  "14.4 15.5 16.8 18.2 19.8".split(' '),
  "14.3 15.4 16.7 18.1 19.7".split(' '),
  "14.2 15.3 16.6 18.0 19.5".split(' '),
  "14.1 15.2 16.4 17.8 19.4".split(' '),
  "14.0 15.1 16.3 17.7 19.3".split(' '),
  "13.9 15.0 16.2 17.6 19.1".split(' '),
  "13.9 14.9 16.1 17.5 19.0".split(' '),
  "13.8 14.9 16.1 17.4 18.9".split(' '),
  "13.7 14.8 16.0 17.3 18.8".split(' '),
  "13.7 14.7 15.9 17.2 18.7".split(' '),
  "13.6 14.7 15.8 17.2 18.7".split(' '),
  "13.6 14.6 15.8 17.1 18.6".split(' '),
  "13.6 14.6 15.7 17.0 18.5".split(' '),
  "13.8 14.8 16.0 17.3 18.9".split(' '),
  "13.8 14.8 16.0 17.3 18.8".split(' '),
  "13.7 14.8 15.9 17.3 18.8".split(' '),
  "13.7 14.7 15.9 17.2 18.7".split(' '),
  "13.6 14.7 15.9 17.2 18.7".split(' '),
  "13.6 14.7 15.8 17.1 18.6".split(' '),
  "13.6 14.6 15.8 17.1 18.6".split(' '),
  "13.5 14.6 15.8 17.1 18.5".split(' '),
  "13.5 14.6 15.7 17.0 18.5".split(' '),
  "13.5 14.5 15.7 17.0 18.5".split(' '),
  "13.4 14.5 15.7 17.0 18.4".split(' '),
  "13.4 14.5 15.6 16.9 18.4".split(' '),
  "13.4 14.4 15.6 16.9 18.4".split(' '),
];

class BMIBaby {
  final String result;
  final Color color;
  final int type;

  BMIBaby({
    required this.result,
    required this.color,
    required this.type,
  });

  static double calculateBMI(num canNang, num chieuCao) {
    return double.parse(
        (canNang / (chieuCao / 100 * chieuCao / 100)).toStringAsFixed(1));
  }

  static int evaluateBMI(Con con, double bmi) {
    bool isTrai = con.gioiTinh == 'Nam' ? true : false;
    int month = (DateTime.now().difference(con.ngaySinh).inDays / 30).round();
    if (month > 36) {
      return evaluateBMIStandard(bmi);
    }
    List<String> values = isTrai ? listBMITrai[month] : listBMIGai[month];
    for (int i = 0; i < values.length; i++) {
      num val = num.parse(values[i]);
      if (val > bmi) {
        return i;
      }
    }
    return 4;
  }

  static int evaluateBMIStandard(double bmi) {
    if (bmi < 18.5) {
      return 0;
    } else if (bmi < 25) {
      return 1;
    } else if (bmi < 30) {
      return 2;
    } else if (bmi < 35) {
      return 3;
    } else if (bmi < 40) {
      return 4;
    } else {
      return 4;
    }
  }
}
