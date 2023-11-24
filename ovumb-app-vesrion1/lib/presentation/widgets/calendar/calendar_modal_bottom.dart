// ignore_for_file: public_member_api_docs, sort_constructors_first
//Hiện modal bottom khi người dùng chọn ngày trong lịch
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/modal/calendar_modal.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/calendar.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/calendar/calendar_modal_circle.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class CalendarModalBottom extends StatefulWidget {
  final DateTime selectedDay;
  final List<CauHoi> listCauHoi;
  final NguoiDung nguoiDung;
  final CalendarDay listCalendar;
  const CalendarModalBottom({
    Key? key,
    required this.selectedDay,
    required this.listCauHoi,
    required this.nguoiDung,
    required this.listCalendar,
  }) : super(key: key);

  @override
  State<CalendarModalBottom> createState() => _CalendarModalBottomState();
}

class _CalendarModalBottomState extends State<CalendarModalBottom> {
  int dayOfChuKi = 0;
  int check = 1;
  bool isShowIcon = false;
  int isSelectedIcon = 0;

  @override
  void initState() {
    super.initState();
    _checkDayOfChuKi();
  }

  //tính ngày còn lại của chu kì
  void _checkDayOfChuKi() {
    DateTime day = widget.selectedDay;
    widget.listCalendar.listKinhNguyet.forEach((kn) {
      DateTime begin = kn.ngayBatDau!;
      DateTime end = kn.ngayKetThuc!;
      // nếu nằm trong chu kì nào thì tính trong chu kì đấy\
      if (checkBetween(day, begin, end)) {
        dayOfChuKi = day.difference(kn.ngayBatDau!).inDays + 1;
        DateTime beginT = kn.ngayBatDauTrung!;
        DateTime endT = kn.ngayKetThucTrung!;
        DateTime beginK = kn.ngayBatDauKinh!;
        DateTime endK = kn.ngayKetThucKinh!;
        if (checkBetween(day, beginK, endK)) {
          check = 0;
        } else if (checkBetween(day, beginT, endT)) {
          check = 2;
        }
      }
    });

    if (widget.listCalendar.listAnToanTuongDoi.contains(widget.selectedDay)) {
      check = 4;
    } else if (widget.listCalendar.listAnToanTuyetDoi
        .contains(widget.selectedDay)) {
      check = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        height: screenSize.height * 0.78,
        width: screenSize.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: CalendarModalCircle(
                    size: size,
                    dayOfChuKi: dayOfChuKi,
                    check: check,
                    listCauHoi: widget.listCauHoi,
                    nguoiDung: widget.nguoiDung,
                    date: widget.selectedDay,
                    listCalendar: widget.listCalendar,
                    indexModal: check,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    widget.listCalendar.listAnToanTuongDoi
                            .contains(widget.selectedDay)
                        ? '*Hãy test que để biết ngày an toàn tuyệt đối của bạn'
                        : 'Ngày ${convertDateTime(widget.selectedDay)} của bạn thế nào?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: grey700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Visibility(
                  visible: !isShowIcon,
                  child: Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: calendarModal[check].containerColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cảm Xúc\nCủa Bạn',
                                    style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Inter')
                                        .copyWith(
                                      color: grey700,
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: isSelectedIcon == 0 ? 10 : 50,
                                    onPressed: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                      });
                                    },
                                    icon: Image.asset(
                                      isSelectedIcon == 0
                                          ? calendarModal[check].plus
                                          : listIconUrl[isSelectedIcon],
                                      scale: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  calendarModal[check].image,
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  calendarModal[check].beginColor,
                                  calendarModal[check].endColor,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    calendarModal[check].title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Inter',
                                    ).copyWith(
                                      color: rose25,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    width: size.width * 0.36,
                                    height: size.height * 0.7 * 0.36 * 0.18,
                                    child: Center(
                                      child: Text(
                                        dayOfChuKi == 0
                                            ? 'KHÔNG RÕ'
                                            : calendarModal[check].textButton,
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ).copyWith(
                                            color:
                                                calendarModal[check].textColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowIcon,
                  child: Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: GridView.count(
                          primary: false,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 3,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor1,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon1.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                      text: 'Buồn bã',
                                      fontWeight: FontWeight.w600,
                                      size: 12,
                                      color: grey700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor2,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon2.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                      text: 'Hơi khó chịu',
                                      fontWeight: FontWeight.w600,
                                      size: 12,
                                      color: grey700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 3;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor3,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon3.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                    text: 'Yêu đời',
                                    fontWeight: FontWeight.w600,
                                    size: 12,
                                    color: grey700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 4;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor4,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon4.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                      text: 'Vui vẻ',
                                      fontWeight: FontWeight.w600,
                                      size: 12,
                                      color: grey700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 5;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor5,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon5.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                      text: 'Mệt mỏi',
                                      fontWeight: FontWeight.w600,
                                      size: 12,
                                      color: grey700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowIcon = !isShowIcon;
                                        isSelectedIcon = 6;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor6,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: rose25,
                                            spreadRadius: 4,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/icons/calendar_icon6.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: TitleText(
                                    text: 'Ngạc nhiên',
                                    fontWeight: FontWeight.w600,
                                    size: 12,
                                    color: grey700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
