import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';

class FlowLogic {
  AgeEnum checkAge(int year) {
    int age = DateTime.now().difference(DateTime(year, 1, 1)).inDays ~/ 365;
    if (age <= 16) {
      return AgeEnum.teenage;
    } else {
      return AgeEnum.adults;
    }
  }
}
