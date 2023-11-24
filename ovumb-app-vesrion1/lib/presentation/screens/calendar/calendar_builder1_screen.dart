// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_month_phase1.dart';

class CalendarBuild1Screen extends StatefulWidget {
  final List<Map<String, DateTime>> listRange;
  final NguoiDung nguoiDung;
  final List<CauHoi> listCauHoi;
  final CalendarDay listCalendar;
  const CalendarBuild1Screen({
    Key? key,
    required this.listRange,
    required this.nguoiDung,
    required this.listCauHoi,
    required this.listCalendar,
  }) : super(key: key);

  @override
  State<CalendarBuild1Screen> createState() => _CalendarBuild1ScreenState();
}

class _CalendarBuild1ScreenState extends State<CalendarBuild1Screen> {
  int getIndex() {
    int index = 0;
    for (int i = 0; i < widget.listRange.length; i++) {
      if (checkBetween(DateTime.now(), widget.listRange[i].values.first,
          widget.listRange[i].values.last)) {
        return i;
      }
    }
    return index;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: widget.listRange.length,
      initialScrollIndex: getIndex(),
      itemBuilder: (context, index) {
        return CalendarMonthPhase1(
          key: ValueKey(widget.listRange[index]),
          monthText: convertMonthYear(widget.listRange[index].values.first),
          startDay: widget.listRange[index].values.first,
          endDay: widget.listRange[index].values.last,
          focusDay: widget.listRange[index].values.first,
          nguoiDung: widget.nguoiDung,
          listCauHoi: widget.listCauHoi,
          listNhatKy: [],
          listCalendar: widget.listCalendar,
        );
      },
      
    );
  }
}
