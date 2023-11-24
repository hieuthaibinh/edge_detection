// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/question/question.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/question/question_input_scroll_picker.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';
import '../../widgets/main_text.dart';
import '../../widgets/sub_text.dart';

// ignore: must_be_immutable
class Question2Screen extends StatefulWidget {
  static const String routeName = 'question2-screen';
  TextEditingController question2;
  TextEditingController question3;
  final bool isUpdate;
  Question2Screen({
    Key? key,
    required this.question2,
    required this.question3,
    required this.isUpdate,
  }) : super(key: key);

  @override
  State<Question2Screen> createState() => _Question2ScreenState();
}

class _Question2ScreenState extends State<Question2Screen> {
  @override
  void dispose() {
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime twoMonthsAgo = now.subtract(Duration(days: 90));
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: rose400, // header background color
              ),
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: twoMonthsAgo,
      lastDate: now,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.question3.text = selectedDate.toString().split(' ')[0];
      });
    }
  }

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
              text: listQuestion[1].title,
              controller: widget.question2,
              beginNumber: 1,
              endNumber: 8,
              subtext: listQuestion[1].sub,
            ),
          ),
          Expanded(
            flex: 2,
            child: widget.isUpdate
                ? const SizedBox()
                : Column(
                    children: [
                      Expanded(
                        //fit: FlexFit.tight,
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TitleText(
                            text: listQuestion[2].title,
                            fontWeight: FontWeight.w600,
                            size: 18,
                            color: grey600,
                          ),
                        ),
                      ),
                      Expanded(
                        //fit: FlexFit.tight,
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            enabled: false,
                            controller: widget.question3,
                            cursorColor: rose300,
                            style: PrimaryFont.medium(16, FontWeight.w500)
                                .copyWith(
                              color: grey300,
                            ),
                            validator: (controller) {
                              if (controller == null || controller.isEmpty) {
                                return 'Vui lòng nhập giá trị';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                'assets/icons/calendar_icon.png',
                                scale: 3,
                              ),
                              focusColor: rose400,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              fillColor: grey25,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                                borderSide: const BorderSide(
                                  width: 0,
                                  color: grey25,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                                borderSide: const BorderSide(
                                  color: rose300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                                borderSide: const BorderSide(
                                  color: grey300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
