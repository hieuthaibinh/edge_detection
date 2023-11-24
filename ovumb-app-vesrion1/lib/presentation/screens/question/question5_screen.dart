// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/validator/validator.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../widgets/input_field_rectangle.dart';
import '../../widgets/title_text.dart';

class Question5Screen extends StatefulWidget {
  static const routeName = 'question5-screen';
  const Question5Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Question5Screen> createState() => _Question5ScreenState();
}

class _Question5ScreenState extends State<Question5Screen> {
  final List<TextEditingController> listInfo = [
    TextEditingController(),
    TextEditingController(),
  ];

  bool isClick = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: TitleText(
                      text: 'Thông Tin Cá Nhân',
                      fontWeight: FontWeight.w600,
                      size: 18,
                      color: greyText,
                    ),
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Stack(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                                backgroundColor: whiteColor,
                                radius: 64,
                              ),
                              Positioned(
                                bottom: -10,
                                left: 80,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/edit_avatar_icon.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            InputFieldRectangle(
                              controller: listInfo[0],
                              name: 'Họ và tên',
                              iconUrl: 'assets/icons/user_unactive.png',
                              isClick: isClick,
                            ),
                            const SizedBox(height: 10),
                            InputFieldRectangle(
                              controller: listInfo[1],
                              name: 'Năm sinh',
                              iconUrl: 'assets/icons/calendar_icon.png',
                              isClick: isClick,
                            ),
                            // InputFieldRectangle(
                            //   controller: listInfo[2],
                            //   name: 'Số điện thoại',
                            //   iconUrl: 'assets/icons/smartphone_icon.png',
                            //   isClick: isClick,
                            // ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
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
                        onPressed: () async {
                          if (!checkEmpty(listInfo)) {
                            showToast(context, 'Bạn chưa nhập đủ thông tin');
                          } else if (!checkBirth(listInfo[1].text)) {
                            showToast(context, 'Năm sinh không hợp lệ');
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              QuestionMainScreen.routeName,
                              (route) => false,
                              arguments: {
                                'tenNguoiDung': listInfo[0].text.trim(),
                                'namSinh':
                                    int.tryParse(listInfo[1].text.trim()) ??
                                        2023,
                              },
                            );
                          }
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
                              screenSize.width,
                              screenSize.height * 0.075,
                            ),
                          ),
                          textStyle: MaterialStateProperty.all(
                            PrimaryFont.semibold(16, FontWeight.w600)
                                .copyWith(color: greyText),
                          ),
                        ),
                        child: Text(
                          'Tiếp tục',
                        ),
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
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
