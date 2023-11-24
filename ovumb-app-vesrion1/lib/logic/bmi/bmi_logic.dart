// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BMI {
  final String result;
  final Color color;
  final int type;

  BMI({
    required this.result,
    required this.color,
    required this.type,
  });

  static double calculateBMI(num canNang, num chieuCao) {
    return double.parse(
        (canNang / (chieuCao / 100 * chieuCao / 100)).toStringAsFixed(1));
  }

  static BMI evaluateBMI(double bmi) {
    if (bmi < 18.5) {
      return listBMI[0];
    } else if (bmi < 25) {
      return listBMI[1];
    } else if (bmi < 30) {
      return listBMI[2];
    } else if (bmi < 35) {
      return listBMI[3];
    } else if (bmi < 40) {
      return listBMI[4];
    } else {
      return listBMI[5];
    }
  }
}

List<BMI> listBMI = [
  BMI(result: 'Gầy', color: Color(0xff6398FF), type: 0),
  BMI(result: 'Bình thường', color: Color(0xff61D3CD), type: 1),
  BMI(result: 'Hơi béo', color: Color(0xffFFA563), type: 2),
  BMI(result: 'Béo phì 1', color: Color(0xffFF636C), type: 3),
  BMI(result: 'Béo phì 2', color: Color(0xffFF636C), type: 3),
  BMI(result: 'Béo phì 3', color: Color(0xffFF636C), type: 3),
];
