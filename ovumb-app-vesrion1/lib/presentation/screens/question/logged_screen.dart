// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/main_text.dart';

import '../../utils/primary_font.dart';

// màn hình khi đã login
class LoggedScreen extends StatelessWidget {
  static const routeName = 'logged-screen';
  const LoggedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 11,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset('assets/images/logged_image.png'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: MainText(
                                  text: 'Chào mừng bạn',
                                  color: rose400,
                                  align: TextAlign.center,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Text(
                                  'Thông tin của bạn đã được lưu thành công vào tài khoản. Thông tin này sẽ giúp chúng tôi dự đoán chính xác hơn và mang đến nhiều trải nghiệm tốt hơn cho bạn.',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: greyText,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              rose600,
                              rose400,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(38),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.1),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            QuestionMainScreen.routeName,
                            (route) => false,
                            arguments: {
                              'isSubmit': false,
                            },
                          );
                        },
                        style: ButtonStyle(
                          // overlayColor: const MaterialStatePropertyAll(
                          //     Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          )),
                          elevation: MaterialStateProperty.all(0),
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              size.width,
                              size.height * 0.075,
                            ),
                          ),
                          textStyle: MaterialStateProperty.all(
                            PrimaryFont.semibold(16, FontWeight.w600)
                                .copyWith(color: greyText),
                          ),
                        ),
                        child: Text('Xác nhận'),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: FractionallySizedBox(
                      child: SizedBox(),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: FractionallySizedBox(
                    heightFactor: 0.1,
                    child: SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
