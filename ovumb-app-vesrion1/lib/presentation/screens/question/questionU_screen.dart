// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/question/question.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/question/question_input_scroll_picker.dart';

import '../../utils/color.dart';
import '../../widgets/main_text.dart';
import '../../widgets/sub_text.dart';

class QuestionUScreen extends StatelessWidget {
  static const String routeName = 'questionU-screen';
  TextEditingController question1;
  TextEditingController question2;
  QuestionUScreen({
    Key? key,
    required this.question1,
    required this.question2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: screenSize.height * 0.1,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: MainText(
                    text: 'Hãy để OvumB hiểu hơn về bạn',
                    color: rose400,
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SubText(
              text:
                  'Thông tin bạn cung cấp cần đảm bảo độ chuẩn xác để được hỗ trợ 1 cách toàn diện nhất',
              size: 16,
              color: greyText,
            ),
          ),
          Expanded(
            flex: 2,
            child: QuestionInputScrollPicker(
              text: listQuestion[0].title,
              controller: question1,
              beginNumber: 21,
              endNumber: 45,
              subtext: listQuestion[0].sub,
            ),
          ),
          Expanded(
            flex: 2,
            child: QuestionInputScrollPicker(
              text: listQuestion[1].title,
              controller: question2,
              beginNumber: 1,
              endNumber: 8,
              subtext: listQuestion[1].sub,
            ),
          ),
          Expanded(
            flex: 2,
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
