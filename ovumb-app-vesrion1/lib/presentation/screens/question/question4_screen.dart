import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/question/question_checkbox_form.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/question/question_radio_form.dart';
import '../../utils/color.dart';
import '../../utils/question.dart';
import '../../widgets/main_text.dart';
import '../../widgets/sub_text.dart';

class Question4Screen extends StatelessWidget {
  static const String routeName = 'question4-screen';
  const Question4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: MainText(
                  text: 'Giúp OvumB hiểu bạn nhiều hơn nhé!',
                  color: rose400,
                  align: TextAlign.center,
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
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        QuestionRadioForm(
                          listOption: one,
                          oneValue: oneValue,
                          textTitle: oneText,
                        ),
                        QuestionCheckboxForm(
                          listOption: two,
                          listValue: twoValue,
                          textTitle: twoText,
                        ),
                        QuestionCheckboxForm(
                          listOption: three,
                          listValue: threeValue,
                          textTitle: threeText,
                        ),
                        QuestionRadioForm(
                          listOption: four,
                          oneValue: fourValue,
                          textTitle: fourText,
                        ),
                        QuestionRadioForm(
                          listOption: five,
                          oneValue: fiveValue,
                          textTitle: fiveText,
                        ),
                        QuestionRadioForm(
                          listOption: six,
                          oneValue: sixValue,
                          textTitle: sixText,
                        ),
                        QuestionCheckboxForm(
                          listOption: seven,
                          listValue: sevenValue,
                          textTitle: sevenText,
                        ),
                        QuestionCheckboxForm(
                          listOption: eight,
                          listValue: eightValue,
                          textTitle: eightText,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    height: 50,
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width,
                      //color: rose600.withOpacity(0.1),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            whiteColor.withOpacity(1),
                            whiteColor.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
