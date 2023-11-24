// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/logic/ads/ads.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarCircleMark extends StatefulWidget {
  final bool hasData;
  final bool isToday;
  final bool isNormal;
  final DateTime day;
  final List<NhatKy> listNhatKy;
  final List<KetQuaTest> listKetQuaTest;

  const CalendarCircleMark({
    Key? key,
    required this.hasData,
    required this.isToday,
    required this.isNormal,
    required this.day,
    required this.listNhatKy,
    required this.listKetQuaTest,
  }) : super(key: key);

  @override
  State<CalendarCircleMark> createState() => _CalendarCircleMarkState();
}

class _CalendarCircleMarkState extends State<CalendarCircleMark> {
  bool hasNhatKy = false;
  List<String> listImage = [
    'assets/icons/circle_drop1.png',
    'assets/icons/circle_drop2.png',
    'assets/icons/circle_drop3.png'
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
    showAds(
      context: context,
      isToday: widget.isToday,
      type: 3,
    );
    checkLH();
  }

  void checkLH() {
    if (widget.hasData) {
      KetQuaTest ketQuaTest = widget.listKetQuaTest
          .where((e) =>
              e.thoiGian.millisecondsSinceEpoch ==
              widget.day.millisecondsSinceEpoch)
          .toList()
          .first;
      if (ketQuaTest.ketQua < 35) {
        index = 2;
      } else if (ketQuaTest.ketQua < 46) {
        index = 1;
      } else {
        index = 0;
      }
    }
  }

  void checkNhatKy(List<NhatKy> listNhatKy) {
    List<NhatKy> nhatKys = listNhatKy
        .where((e) =>
            e.thoiGian.millisecondsSinceEpoch ==
            widget.day.millisecondsSinceEpoch)
        .toList();
    if (nhatKys.isNotEmpty) {
      hasNhatKy = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkNhatKy(widget.listNhatKy);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.isNormal
              ? Container()
              : Center(
                  child: Image.asset(
                    widget.hasData
                        ? listImage[index]
                        : 'assets/icons/rounded_circle_calendar.png',
                    scale: 2.8,
                    fit: BoxFit.cover,
                    color: pink700,
                  ),
                ),
          Center(
            child: Text(
              widget.day.day.toString(),
              style: TextStyle(
                color: widget.hasData ? whiteColor : grey700,
              ),
            ),
          ),
          hasNhatKy
              ? Positioned(
                  bottom: 10,
                  child: Image.asset(
                    'assets/icons/dash1.png',
                    scale: 1,
                    width: 15,
                    color: widget.hasData ? whiteColor : rose400,
                  ),
                )
              : widget.isToday
                  ? Positioned(
                      bottom: 8,
                      child: Image.asset(
                        'assets/icons/white_dot.png',
                        scale: 2.5,
                        color: widget.isNormal
                            ? rose400
                            : widget.hasData
                                ? whiteColor
                                : rose400,
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
