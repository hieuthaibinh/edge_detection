// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_dash.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_rectangle.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_safe_mark.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_water_mark.dart';

// hiện calendar
class CalendarPhase1Display extends StatefulWidget {
  final CalendarDay listCalendar;
  final DateTime day;

  const CalendarPhase1Display({
    Key? key,
    required this.listCalendar,
    required this.day,
  }) : super(key: key);

  @override
  State<CalendarPhase1Display> createState() => _CalendarPhase1DisplayState();
}

class _CalendarPhase1DisplayState extends State<CalendarPhase1Display> {
  @override
  Widget build(BuildContext context) {
    if (checkToday(widget.day)) {
      if (checkMark(widget.day, widget.listCalendar.listLH)) {
        return CalendarRectangleMark(
          hasData: true,
          isToday: true,
          isNormal: false,
          day: widget.day,
          listNhatKy: widget.listCalendar.listNhatKy,
          listKetQuaTest: widget.listCalendar.listKetQuaTest,
        );
      } else if (checkMark(widget.day, widget.listCalendar.listTrung)) {
        return CalendarRectangleMark(
          hasData: checkData(widget.day, widget.listCalendar.listLuongKinh),
          isToday: true,
          isNormal: false,
          day: widget.day,
          listNhatKy: widget.listCalendar.listNhatKy,
          listKetQuaTest: widget.listCalendar.listKetQuaTest,
        );
      } else if (checkMark(widget.day, widget.listCalendar.listKinh)) {
        return CalendarWaterMark(
          hasData: checkData(widget.day, widget.listCalendar.listLuongKinh),
          isToday: true,
          isNormal: false,
          day: widget.day,
          listLuongKinh: widget.listCalendar.listLuongKinh,
          listNhatKy: widget.listCalendar.listNhatKy,
        );
      } else if (checkMark(
          widget.day, widget.listCalendar.listAnToanTuyetDoi)) {
        return CalendarSafeMark(
          isToday: true,
          isNormal: true,
          check: true,
          day: widget.day,
          listNhatKy: widget.listCalendar.listNhatKy,
        );
      } else if (checkMark(
          widget.day, widget.listCalendar.listAnToanTuongDoi)) {
        return CalendarSafeMark(
          isToday: true,
          isNormal: true,
          check: true,
          day: widget.day,
          listNhatKy: widget.listCalendar.listNhatKy,
        );
      }
      return CalendarHash(
        day: widget.day,
        listNhatKy: widget.listCalendar.listNhatKy,
        isToday: true,
      );
    } else if (checkMark(widget.day, widget.listCalendar.listLH)) {
      return CalendarRectangleMark(
        hasData: true,
        isToday: false,
        isNormal: false,
        day: widget.day,
        listNhatKy: widget.listCalendar.listNhatKy,
        listKetQuaTest: widget.listCalendar.listKetQuaTest,
      );
    } else if (checkMark(widget.day, widget.listCalendar.listTrung)) {
      return CalendarRectangleMark(
        hasData: checkData(widget.day, widget.listCalendar.listLuongKinh),
        isToday: false,
        isNormal: false,
        day: widget.day,
        listNhatKy: widget.listCalendar.listNhatKy,
        listKetQuaTest: widget.listCalendar.listKetQuaTest,
      );
    } else if (checkMark(widget.day, widget.listCalendar.listKinh)) {
      return CalendarWaterMark(
        hasData: checkData(widget.day, widget.listCalendar.listLuongKinh),
        isToday: false,
        isNormal: false,
        day: widget.day,
        listLuongKinh: widget.listCalendar.listLuongKinh,
        listNhatKy: widget.listCalendar.listNhatKy,
      );
    } else if (checkMark(widget.day, widget.listCalendar.listAnToanTuyetDoi)) {
      return CalendarSafeMark(
        isToday: false,
        isNormal: false,
        check: false,
        day: widget.day,
        listNhatKy: widget.listCalendar.listNhatKy,
      );
    } else if (checkMark(widget.day, widget.listCalendar.listAnToanTuongDoi)) {
      return CalendarSafeMark(
        isToday: false,
        isNormal: true,
        check: true,
        day: widget.day,
        listNhatKy: widget.listCalendar.listNhatKy,
      );
    }
    return CalendarHash(
      day: widget.day,
      listNhatKy: widget.listCalendar.listNhatKy,
      isToday: false,
    );
  }
}
