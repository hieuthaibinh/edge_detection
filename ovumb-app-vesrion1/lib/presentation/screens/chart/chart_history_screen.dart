// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chat_full_history_screen.dart';

import '../../utils/color.dart';
import '../../widgets/title_text.dart';

// màn hỉnh hiển thị lịch sử của 4 lần test gần nhất
class ChartHistoryScreen extends StatefulWidget {
  static const routeName = 'chart-history-screen';
  final List<KetQuaTest> listKetQuaTest;
  const ChartHistoryScreen({
    Key? key,
    required this.listKetQuaTest,
  }) : super(key: key);

  @override
  State<ChartHistoryScreen> createState() => _ChartHistoryScreenState();
}

class _ChartHistoryScreenState extends State<ChartHistoryScreen> {
  late Map<int, List<KetQuaTest>> data;

  Map<int, List<KetQuaTest>> generateKetQuaTest(
      List<KetQuaTest> listKetQuaTest) {
    Map<int, List<KetQuaTest>> data = {};
    List<KetQuaTest> list = [];
    int month = listKetQuaTest.first.thoiGian.month;
    for (KetQuaTest test in listKetQuaTest) {
      if (test.thoiGian.month != month) {
        data[month] = list;
        month = test.thoiGian.month;
        list = [];
      }
      if (test.thoiGian.month == month) {
        list.add(test);
      }
    }
    data[month] = list;
    return data;
  }

  @override
  void initState() {
    data = generateKetQuaTest(widget.listKetQuaTest);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lịch sử test',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: rose500,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/icons/x_icon.png',
              color: rose500,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: violet500,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: TitleText(
                            text: 'Ngày',
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: TitleText(
                          text: 'Giờ',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: TitleText(
                          text: 'Giá trị LH',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: TitleText(
                          text: 'Lần Test',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ChatFullHistoryScreen(
                    title: 'Chu kì tháng ${data.keys.elementAt(index)}',
                    listKetQuaTest: data[data.keys.elementAt(index)]!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
