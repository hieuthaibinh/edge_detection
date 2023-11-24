// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/logic/ads/ads.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarWaterMark extends StatefulWidget {
  final bool hasData;
  final bool isToday;
  final bool isNormal;
  final DateTime day;
  final List<LuongKinh> listLuongKinh;
  final List<NhatKy> listNhatKy;
  const CalendarWaterMark({
    Key? key,
    required this.hasData,
    required this.isToday,
    required this.isNormal,
    required this.day,
    required this.listLuongKinh,
    required this.listNhatKy,
  }) : super(key: key);

  @override
  State<CalendarWaterMark> createState() => _CalendarWaterMarkState();
}

class _CalendarWaterMarkState extends State<CalendarWaterMark> {
  final List<String> listImage = [
    'assets/icons/kinh_nhieu.png',
    'assets/icons/kinh_trungbinh.png',
    'assets/icons/kinh_it.png',
  ];
  int index = 2;
  bool hasNhatKy = false;

  @override
  void initState() {
    super.initState();
    showAds(
      context: context,
      isToday: widget.isToday,
      type: 1,
    );
  }

  void checkKinh(List<LuongKinh> listLuongKinh) {
    if (widget.hasData) {
      LuongKinh luongKinh = listLuongKinh
          .where((e) =>
              e.thoiGian.millisecondsSinceEpoch ==
              widget.day.millisecondsSinceEpoch)
          .toList()
          .first;

      if (luongKinh.luongKinh == 'Ít') {
        index = 2;
      } else if (luongKinh.luongKinh == 'Trung bình') {
        index = 1;
      } else if (luongKinh.luongKinh == 'Nhiều') {
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
    checkKinh(widget.listLuongKinh);
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
                        : 'assets/icons/rounded_water_calendar.png',
                    scale: 2.8,
                    fit: BoxFit.cover,
                  ),
                ),
          Center(
            child: Text(
              widget.day.day.toString(),
              style: TextStyle(
                color: widget.hasData ? whiteColor : greyText,
              ),
            ),
          ),
          hasNhatKy
              ? Positioned(
                  bottom: 8,
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
