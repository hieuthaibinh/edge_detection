import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/question/question_input.dart';
import '../../utils/color.dart';
import '../../widgets/main_text.dart';
import '../../widgets/sub_text.dart';

class Question1Screen extends StatefulWidget {
  static const String routeName = 'question1-screen';
  const Question1Screen({super.key});

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(),
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
                    text: 'Điều OvumB muốn biết về bạn',
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
            child: QuestionInput(
              text: 'Chu kì kinh ngắn nhất',
              controller: controller1,
            ),
          ),
          Expanded(
            flex: 2,
            child: QuestionInput(
              text: 'Chu kì kinh dài nhất',
              controller: controller2,
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
