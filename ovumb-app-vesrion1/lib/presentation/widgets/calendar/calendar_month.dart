// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_display.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import 'calendar_modal_bottom.dart';

// hiển thị lịch theo từng tháng
class CalendarMonth extends StatefulWidget {
  final String monthText;
  final DateTime startDay;
  final DateTime endDay;
  final DateTime focusDay;
  final NguoiDung nguoiDung;
  final List<CauHoi> listCauHoi;
  final List<NhatKy> listNhatKy;
  final CalendarDay listCalendar;

  const CalendarMonth({
    Key? key,
    required this.monthText,
    required this.startDay,
    required this.endDay,
    required this.focusDay,
    required this.nguoiDung,
    required this.listCauHoi,
    required this.listNhatKy,
    required this.listCalendar,
  }) : super(key: key);

  @override
  State<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          TitleText(
            text: widget.monthText,
            fontWeight: FontWeight.w700,
            size: 14,
            color: grey700,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: rose50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TableCalendar(
              rowHeight: 45,
              locale: 'vi',
              availableCalendarFormats: const {
                CalendarFormat.month: '',
                CalendarFormat.week: '',
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: widget.focusDay,
              firstDay: widget.startDay,
              lastDay: widget.endDay,
              headerVisible: false,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                decoration: const BoxDecoration(
                  color: rose50,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleTextStyle:
                    PrimaryFont.medium(14, FontWeight.w500).copyWith(
                  color: grey700,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) {
                  return convertWeekDay(date.weekday);
                },
                decoration: BoxDecoration(
                  color: rose50,
                ),
                weekdayStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: grey700,
                  fontSize: 14,
                ),
                weekendStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: grey700,
                  fontSize: 14,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                disabledBuilder: (context, day, focusedDay) {
                  return Container();
                },
                markerBuilder: (context, day, markedDates) {
                  DateFormat formatter = DateFormat(
                      'yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
                  DateTime selecteDay = DateTime.parse(formatter.format(day));
                  return CalendarDisplay(
                    listCalendar: widget.listCalendar,
                    day: selecteDay,
                  );
                },
              ),
              calendarStyle: const CalendarStyle(
                rowDecoration: BoxDecoration(
                  color: rose50,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) async {
                DateFormat formatter = DateFormat(
                    'yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
                DateTime selecteDay =
                    DateTime.parse(formatter.format(selectedDay));

                showModalBottomSheet(
                  backgroundColor: Colors.white.withOpacity(0),
                  barrierColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(26),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: screenSize.height * 0.82,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            child: Container(
                              height: screenSize.height * 0.1,
                              width: screenSize.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    rose300.withOpacity(0.7),
                                    rose300.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: CalendarModalBottom(
                              selectedDay: selecteDay,
                              nguoiDung: widget.nguoiDung,
                              listCauHoi: widget.listCauHoi,
                              listCalendar: widget.listCalendar,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  isScrollControlled: true,
                );
              },
              availableGestures: AvailableGestures.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
