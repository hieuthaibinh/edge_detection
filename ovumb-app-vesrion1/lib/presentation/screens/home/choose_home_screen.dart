// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/constant/choose_phase.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_initial_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:lottie/lottie.dart';

//phần chọn màn
class ChooseHomeScreen extends StatefulWidget {
  static const routeName = 'choose-home-screen';
  const ChooseHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseHomeScreen> createState() => _ChooseHomeScreenState();
}

class _ChooseHomeScreenState extends State<ChooseHomeScreen> {
  List<bool> select = [false, false, false, false];
  List<String> chooseText = [
    'Bạn đang mong muốn sử dụng',
    'Theo dõi sức khỏe, đồng hành và hỗ trợ canh trứng sinh con theo ý muốn',
    'Theo dõi và quản lý chu kỳ kinh',
    'Hướng dẫn chăm sóc mẹ và bé sau sinh',
    'Quản lý và hướng dẫn chăm sóc sức khỏe mẹ bầu',
  ];

  List<Color> chooseColor = [grey700, rose500, violet500, blue500, green500];
  int pos = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/logo_app.png',
                    scale: 2.8,
                    //fit: BoxFit.scaleDown,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            TitleText(
                              text: 'Hãy lựa chọn tính năng',
                              fontWeight: FontWeight.w700,
                              size: 24,
                              color: grey700,
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: ChooseText(
                                text: chooseText[pos],
                                textColor: chooseColor[pos],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: -30,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            child: Transform(
                              transform: Matrix4.rotationY(3.14),
                              child: Lottie.asset(
                                'assets/animations/arrow_down.json',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            select = [false, false, false, false];
                            setState(() {
                              select[index] = true;
                              pos = index + 1;
                            });
                          },
                          splashColor: grey200,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        choosePhase[index].image,
                                        scale: 3,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TitleText(
                                                text: choosePhase[index].title,
                                                fontWeight: FontWeight.w600,
                                                size: 16,
                                                color: grey700,
                                              ),
                                              const SizedBox(height: 2),
                                              TitleText(
                                                text:
                                                    choosePhase[index].subTitle,
                                                fontWeight: FontWeight.w400,
                                                size: 16,
                                                color: grey500,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        !select[index]
                                            ? 'assets/icons/radio_uncheck.png'
                                            : 'assets/icons/radio_check.png',
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  color: grey100,
                                  thickness: 1,
                                  height: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: const SizedBox(),
                ),
                Expanded(
                  flex: 2,
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
                        if (pos == 1 || pos == 2) {
                          Navigator.pushNamed(
                            context,
                            QuestionMainScreen.routeName,
                            arguments: pos,
                          );
                        } else if (pos == 3) {
                          LoadingLogo().show(context: context);
                          bool check =
                              await ServerRepository().updatePhase(phase: 4);
                          bool check1 = await LocalRepository().updatePhase(4);
                          LoadingLogo().hide();
                          if (check && check1) {
                            Navigator.pushNamed(
                              context,
                              Home3.routeName,
                            );
                          } else {
                            showErrorDialog(context,
                                'Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng');
                          }
                        } else if (pos == 4) {
                          Navigator.pushNamed(
                            context,
                            Phase2InitialScreen.routeName,
                            arguments: {
                              'phase': null,
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        )),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            size.width * 0.9,
                            size.height * 0.065,
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
                const Expanded(
                  flex: 2,
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

class ChooseText extends StatelessWidget {
  final String text;
  final Color textColor;
  const ChooseText({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ).copyWith(color: textColor),
      textAlign: TextAlign.center,
    );
  }
}
