// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/logic/ads/ads.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarSafeMark extends StatefulWidget {
  final bool isToday;
  final bool isNormal;
  final DateTime day;
  final List<NhatKy> listNhatKy;
  final bool check;

  const CalendarSafeMark({
    Key? key,
    required this.isToday,
    required this.isNormal,
    required this.day,
    required this.listNhatKy,
    required this.check,
  }) : super(key: key);

  @override
  State<CalendarSafeMark> createState() => _CalendarSafeMarkState();
}

class _CalendarSafeMarkState extends State<CalendarSafeMark> {
  bool hasNhatKy = false;

  @override
  void initState() {
    super.initState();
    showAds(
      context: context,
      isToday: widget.isToday,
      type: 2,
    );
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
          Image.asset(
            widget.check
                ? 'assets/icons/rectangle_dash.png'
                : 'assets/icons/rectangle_fill.png',
            scale: 2.8,
            fit: BoxFit.cover,
            color: const Color(0xff5181FF),
          ),
          Center(
            child: Text(
              widget.day.day.toString(),
              style: TextStyle(
                color: widget.check ? const Color(0xff5181FF) : whiteColor,
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
                    color: rose400,
                  ),
                )
              : widget.isToday
                  ? Positioned(
                      bottom: 8,
                      child: Image.asset(
                        'assets/icons/white_dot.png',
                        scale: 2.5,
                        color: widget.isNormal ? rose400 : whiteColor,
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
