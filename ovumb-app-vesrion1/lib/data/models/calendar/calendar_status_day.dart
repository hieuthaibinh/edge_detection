import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarStatusDay {
  final Color fromColor;
  final Color toColor;
  final String status;

  CalendarStatusDay(
    this.fromColor,
    this.toColor,
    this.status,
  );
}

List<CalendarStatusDay> statusDayOfCKKN = [
  CalendarStatusDay(pink800, pink500, 'CAO'),
  CalendarStatusDay(pink800.withOpacity(0.7),
      pink500.withOpacity(0.7), 'TRUNG BÌNH'),
  CalendarStatusDay(pink800.withOpacity(0.3),
      pink500.withOpacity(0.3), 'THẤP'),
];