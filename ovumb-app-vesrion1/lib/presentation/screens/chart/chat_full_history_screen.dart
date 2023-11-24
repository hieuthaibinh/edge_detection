// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/chart/chart_history_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ChatFullHistoryScreen extends StatelessWidget {
  final String title;
  final List<KetQuaTest> listKetQuaTest;

  const ChatFullHistoryScreen({
    Key? key,
    required this.title,
    required this.listKetQuaTest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: rose50,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TitleText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: listKetQuaTest.length,
              itemBuilder: (context, index) {
                return ChartHistoryItem(ketQuaTest: listKetQuaTest[index]);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
