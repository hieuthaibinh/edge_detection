// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/logic/chart/chart_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';

//đây item thông số của mỗi lần test để hiện ra trong listview ở phần biểu đồ
class ChartHistoryItem extends StatelessWidget {
  final KetQuaTest ketQuaTest;
  const ChartHistoryItem({
    Key? key,
    required this.ketQuaTest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6),
        ),
        height: 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: TitleText(
                  text: convertDateTimeChart(ketQuaTest.thoiGian),
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TitleText(
                  text:
                      '${ketQuaTest.thoiGian.hour}:${ketQuaTest.thoiGian.minute}',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TitleText(
                  text: checkLH(ketQuaTest.ketQua),
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TitleText(
                  text: ketQuaTest.lanTest.toString(),
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
