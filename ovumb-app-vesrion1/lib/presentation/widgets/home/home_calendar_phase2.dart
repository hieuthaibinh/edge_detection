// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/ckkn_display.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/local/data_notification.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_display.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_modal_bottom.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_half_percent_container.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class HomeCalendarPhase2 extends StatefulWidget {
  final CalendarDay listCalendar;
  final CKKNDisplay ckknDisplay;
  final List<CauHoi> listCauHoi;
  final NguoiDung nguoiDung;

  const HomeCalendarPhase2({
    Key? key,
    required this.listCalendar,
    required this.ckknDisplay,
    required this.listCauHoi,
    required this.nguoiDung,
  }) : super(key: key);

  @override
  State<HomeCalendarPhase2> createState() => _HomeCalendarPhase2State();
}

class _HomeCalendarPhase2State extends State<HomeCalendarPhase2> {
  //percent
  bool leftShow = false;
  bool rightShow = false;
  bool bothShow = true;

  //get dislay ckkn
  //late CKKNDisplay ckknDisplay;

  @override
  void initState() {
    // lấy dữ liệu
    //ckknDisplay = getCKKNDisplay(widget.listCalendar.currentKinhNguyet);
    // gửi thông báo
    checkNotification(widget.listCalendar.listKinhNguyet, widget.ckknDisplay,
        flutterLocalNotificationsPlugin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: rose50,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TableCalendar(
                  rowHeight: 45,
                  locale: 'vi',
                  calendarFormat: CalendarFormat.month,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2030, 3, 14),
                  headerStyle: HeaderStyle(
                      titleTextFormatter: (date, _) => 'Tháng ${date.month}',
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        color: rose50,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      leftChevronIcon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: rose400,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: rose400,
                      ),
                      rightChevronPadding: const EdgeInsets.only(right: 50),
                      leftChevronPadding: const EdgeInsets.only(left: 50),
                      titleTextStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: grey700,
                      )),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) {
                      return convertWeekDay(date.weekday);
                    },
                    decoration: BoxDecoration(
                      color: rose50,
                    ),
                    weekdayStyle: TextStyle(
                      //fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: grey700,
                      fontSize: 14,
                    ),
                    weekendStyle: TextStyle(
                      //fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: grey700,
                      fontSize: 14,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, markedDates) {
                      DateFormat formatter = DateFormat(
                          'yyyy-MM-dd 00:00:00.000'); // Định dạng mong muốn
                      DateTime selecteDay =
                          DateTime.parse(formatter.format(day));
                      return CalendarDisplay(
                        listCalendar: widget.listCalendar,
                        day: selecteDay,
                      );
                    },
                  ),
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(color: grey900),
                    weekendTextStyle: TextStyle(color: grey900),
                    rowDecoration: BoxDecoration(
                      color: rose50,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    // selectedDecoration: BoxDecoration(
                    //   color: primaryColorBlue500,
                    //   shape: BoxShape.circle,
                    // ),
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
                                  listCauHoi: widget.listCauHoi,
                                  nguoiDung: widget.nguoiDung,
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
                  availableGestures: AvailableGestures.horizontalSwipe,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: bothShow
                          ? 2
                          : leftShow
                              ? 78
                              : 22,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!leftShow && !rightShow) {
                              leftShow = true;
                              bothShow = false;
                            } else if (rightShow) {
                              rightShow = false;
                              bothShow = true;
                            } else {
                              leftShow = false;
                              bothShow = true;
                            }
                          });
                        },
                        child: HomeHalfPercentContainer(
                          size: screenSize,
                          color: rose600,
                          backgroundColor: rose100,
                          text: widget.ckknDisplay.snkcl.toString(),
                          percent: widget.ckknDisplay.kinhPercent,
                          titleText: widget.ckknDisplay.kinhPercent == 1
                              ? widget.ckknDisplay.titleKinh[1]
                              : widget.ckknDisplay.titleKinh[0],
                          subText: widget.ckknDisplay.kinhPercent == 1
                              ? widget.ckknDisplay.subKinh[1]
                              : widget.ckknDisplay.subKinh[0],
                          subTextColor: rose400,
                          imageUrl: 'assets/icons/ngay_kinh.png',
                          visibleSubText: leftShow,
                          visibleTitleText: !rightShow,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: bothShow
                          ? 2
                          : leftShow
                              ? 22
                              : 78,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!rightShow && !leftShow) {
                              rightShow = true;
                              bothShow = false;
                            } else if (leftShow) {
                              leftShow = false;
                              bothShow = true;
                            } else {
                              rightShow = false;
                              bothShow = true;
                            }
                          });
                        },
                        child: HomeHalfPercentContainer(
                          size: screenSize,
                          color: pink600,
                          backgroundColor: pink100,
                          text: widget.ckknDisplay.sntcl.toString(),
                          percent: widget.ckknDisplay.trungPercent,
                          titleText: widget.ckknDisplay.trungPercent == 1
                              ? widget.ckknDisplay.titleTrung[1]
                              : widget.ckknDisplay.titleTrung[0],
                          subText: widget.ckknDisplay.trungPercent == 1
                              ? widget.ckknDisplay.subTrung[1]
                              : widget.ckknDisplay.subTrung[0],
                          subTextColor: pink400,
                          imageUrl: 'assets/icons/ngay_trung.png',
                          visibleSubText: rightShow,
                          visibleTitleText: !leftShow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/chu_thich_icon.png',
                scale: 3,
              ),
              onPressed: () {
                if (widget.nguoiDung.phase == 2) {
                  dialogBuilder(context, screenSize);
                } else if (widget.nguoiDung.phase == 1) {
                  dialogBuilder1(context, screenSize);
                } else {
                  dialogBuilder2(context, screenSize);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
