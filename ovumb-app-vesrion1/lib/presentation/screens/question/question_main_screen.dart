// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question3_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/indicator.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../widgets/title_text.dart';

class QuestionMainScreen extends StatefulWidget {
  static const routeName = 'question-main-screen';
  final int phase;
  const QuestionMainScreen({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  State<QuestionMainScreen> createState() => _QuestionMainScreenState();
}

class _QuestionMainScreenState extends State<QuestionMainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PageController controller = PageController();
  List<TextEditingController> question = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  bool check() {
    for (TextEditingController ques in question) {
      if (ques.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [
      Question3Screen(
        question1: question[0],
        question2: question[1],
      ),
      Question2Screen(
        question2: question[2],
        question3: question[3],
        isUpdate: false,
      ),
    ];
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        body: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _currentIndex != 0
                              ? IconButton(
                                  onPressed: () {
                                    controller.animateToPage(
                                      _currentIndex - 1,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: rose400,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        const Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.center,
                            child: TitleText(
                              text: 'Thông tin sức khỏe',
                              fontWeight: FontWeight.w600,
                              size: 18,
                              color: greyText,
                            ),
                          ),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: PageView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          setState(() {
                            _currentIndex = value;
                          });
                        },
                        children: _list,
                      ),
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
                            if (_currentIndex == _list.length - 1) {
                              if (check()) {
                                int ckdn = int.parse(question[1].text.trim());
                                int cknn = int.parse(question[0].text.trim());
                                int snck = int.parse(question[2].text.trim());
                                int tbnkn = (ckdn + cknn) ~/ 2;
                                int snct = 7;
                                String ngayBatDau = question[3].text.trim();
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEventInsertKinhNguyet(
                                      kinhNguyet: KinhNguyet(
                                        tbnkn: tbnkn,
                                        snck: snck,
                                        snct: snct,
                                        ckdn: ckdn,
                                        cknn: cknn,
                                        ngayBatDau: DateTime.parse(ngayBatDau),
                                      ),
                                      phase: widget.phase,
                                    ));
                              } else {
                                showToast(
                                    context, 'Bạn hãy nhập đủ hết thông tin');
                              }
                            } else {
                              controller.animateToPage(
                                _currentIndex + 1,
                                curve: Curves.easeInOut,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
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
                          child: Text(
                            _currentIndex == _list.length - 1
                                ? 'Hoàn thành'
                                : 'Tiếp tục',
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
                    child: FractionallySizedBox(
                      heightFactor: 0.1,
                      child: Container(
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: _list.length,
                          itemBuilder: (context, index) {
                            return buildIndicator(index == _currentIndex, size);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
