import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

enum ChoAnEnum {
  bume,
  suacongthuc,
  suame,
  andam,
  phattrien,
  hutsua,
}

int getMaChoAn(ChoAnEnum choAnEnum) {
  switch (choAnEnum) {
    case ChoAnEnum.bume:
      return 1;
    case ChoAnEnum.suacongthuc:
      return 2;
    case ChoAnEnum.suame:
      return 3;
    case ChoAnEnum.andam:
      return 4;
    default:
      return 1;
  }
}

Color getColorChoAn(int maLoaiChoAn) {
  switch (maLoaiChoAn) {
    case 1:
      return Color(0xffFD6F8E);
    case 2:
      return Color(0xff4168F2);
    case 3:
      return Color(0xffF3B975);
    case 4:
      return Color(0xff2EB6BE);
    default:
      return Color(0xffFD6F8E);
  }
}

List<Color> getColorChartChoAn(ChoAnEnum choAnEnum) {
  switch (choAnEnum) {
    case ChoAnEnum.bume:
      return [violet500, Color(0xffFD6F8E)];
    case ChoAnEnum.suacongthuc:
      return [Color(0xff4168F2), Color(0xffF3B975)];
    case ChoAnEnum.suame:
      return [Color(0xff4168F2), Color(0xffF3B975)];
    case ChoAnEnum.andam:
      return [Color(0xff2EB6BE), Color(0xff2EB6BE)];
    default:
      return [violet500, Color(0xffFD6F8E)];
  }
}
