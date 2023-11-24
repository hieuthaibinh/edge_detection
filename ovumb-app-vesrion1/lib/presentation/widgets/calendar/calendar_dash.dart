// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nhat_ky.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarHash extends StatefulWidget {
  final DateTime day;
  final List<NhatKy> listNhatKy;
  final bool isToday;

  const CalendarHash({
    Key? key,
    required this.day,
    required this.listNhatKy,
    required this.isToday,
  }) : super(key: key);

  @override
  State<CalendarHash> createState() => _CalendarHashState();
}

class _CalendarHashState extends State<CalendarHash> {
  bool hasNhatKy = false;

  @override
  void initState() {
    super.initState();
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
          Center(
            child: Text(
              widget.day.day.toString(),
              style: TextStyle(
                color: grey700,
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
                        color: rose400,
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
