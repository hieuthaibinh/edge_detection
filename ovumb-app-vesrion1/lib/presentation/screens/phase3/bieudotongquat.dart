// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudo_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudotimeline_widget.dart';

class BieuDoTongQuat extends StatelessWidget {
  final List<PhatTrienCon> phatTrienCon;
  TextEditingController bmiController;
  TextEditingController listenController;
  final int maCon;
  BieuDoTongQuat({
    Key? key,
    required this.phatTrienCon,
    required this.bmiController,
    required this.listenController,
    required this.maCon,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double listHeight = phatTrienCon.length * 80;
    double maxHeight = 200 + listHeight;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: SizedBox(
        height: maxHeight,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 110,
              margin: const EdgeInsets.only(right: 25),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(1, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: size.width,
                    height: 90,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BieuDoWidget(
                            title: 'Cân nặng',
                            number: phatTrienCon.isNotEmpty
                                ? phatTrienCon.first.canNang
                                : null,
                            descripble: 'kg',
                          ),
                          VerticalDivider(color: grey300, thickness: 1),
                          BieuDoWidget(
                            title: 'Chiều cao',
                            number: phatTrienCon.isNotEmpty
                                ? phatTrienCon.first.chieuCao
                                : null,
                            descripble: 'cm',
                          ),
                          VerticalDivider(color: grey300, thickness: 1),
                          BieuDoWidget(
                            title: 'BMI',
                            number: bmiController.text == ''
                                ? null
                                : double.tryParse(bmiController.text),
                            descripble: 'kg/m2',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 25,
              ),
              height: listHeight,
              width: size.width,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: phatTrienCon.length,
                itemBuilder: (context, index) {
                  return BieuDoTimeline(
                    listenChangeController: listenController,
                    maCon: maCon,
                    choAnEnum: ChoAnEnum.phattrien,
                    time: 'Tháng ${phatTrienCon.length - index}',
                    ml: null,
                    index: index,
                    date: phatTrienCon[index].thoiGian,
                    last: (phatTrienCon.length - 1) == index,
                    canNang: phatTrienCon[index].canNang,
                    chieuCao: phatTrienCon[index].chieuCao,
                    timelines: [
                      TimelineDetail(
                          text: '${phatTrienCon[index].canNang.toString()} kg'),
                      TimelineDetail(
                          text:
                              '${phatTrienCon[index].chieuCao.toString()} cm'),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
