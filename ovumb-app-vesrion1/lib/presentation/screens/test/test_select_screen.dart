// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quan_ly_que_test.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/man_huong_dan/image_analyze_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/test_thai_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// màn hình chọn que test
class TestSelectScreen extends StatefulWidget {
  static const routeName = 'test-select-screen';
  final QuanLyQueTest quanLyQueTest;
  final List<Guide> images;
  final List<Guide> videos;
  const TestSelectScreen({
    Key? key,
    required this.quanLyQueTest,
    required this.images,
    required this.videos,
  }) : super(key: key);

  @override
  State<TestSelectScreen> createState() => _TestSelectScreenState();
}

class _TestSelectScreenState extends State<TestSelectScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late Animation<double> animation;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    setRotation(15);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }

  //animation
  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: -0.1, end: angle).animate(controller);
    animation1 = Tween<double>(begin: -0.1, end: angle).animate(controller1);
  }

  bool test1Selected = false;
  bool test2Selected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int quetrung = widget.quanLyQueTest.soLuongQueTrung;
    int quethai = widget.quanLyQueTest.soLuongQueThai;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    TitleText(
                      text: 'Chọn que Test',
                      fontWeight: FontWeight.w700,
                      size: 24,
                      color: rose400,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        child: test1Selected
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Bạn đã lựa chọn',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: grey700,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' Que test thử rụng trứng\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: violet400,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'Còn ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: grey700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$quetrung lượt sử dụng ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: violet400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            : test2Selected
                                ? RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Bạn đã lựa chọn',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: grey700,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' Que test thử thai\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: greenColor,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Còn ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: grey700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '$quethai lượt sử dụng ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: greenColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    'Lựa chọn que phù hợp với mục đích của bạn',
                                    style:
                                        PrimaryFont.regular(16, FontWeight.w400)
                                            .copyWith(
                                      color: grey700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 14,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 40,
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) => Transform.scale(
                          scale: animation.value + 1,
                          child: Transform.rotate(
                            angle: animation.value,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // nếu bằng true thì đảo ngược lại, fasle thì chạy lên
                                  test1Selected
                                      ? controller.reverse(from: 15)
                                      : controller.forward(from: 0);

                                  test1Selected = !test1Selected;

                                  //nếu test2 cũng đang được chọn thì set về false đồng thời đảo lại
                                  if (test2Selected) {
                                    test2Selected = !test2Selected;
                                    controller1.reverse(from: 15);
                                  }
                                });
                              },
                              hoverColor: Colors.transparent,
                              child: SizedBox(
                                width: size.width * 0.8,
                                child: Image.asset(
                                  test2Selected
                                      ? 'assets/images/unselect_que_test.png'
                                      : 'assets/images/que_test_1.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 40,
                      child: AnimatedBuilder(
                        animation: animation1,
                        builder: (context, child) => Transform.scale(
                          scale: animation1.value + 1,
                          child: Transform.rotate(
                            angle: animation1.value,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  test2Selected
                                      ? controller1.reverse(from: 15)
                                      : controller1.forward(from: 0);

                                  test2Selected = !test2Selected;
                                  if (test1Selected) {
                                    test1Selected = !test1Selected;
                                    controller.reverse(from: 15);
                                  }
                                });
                              },
                              hoverColor: Colors.transparent,
                              child: SizedBox(
                                width: size.width * 0.8,
                                child: Image.asset(
                                  test1Selected
                                      ? 'assets/images/unselect_que_test.png'
                                      : 'assets/images/que_test_2.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          test2Selected
                              ? 'assets/images/dot_test_unselect.png'
                              : 'assets/images/dot_test_que_1.png',
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const TitleText(
                          text: 'Que thử rụng trứng',
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: grey600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          test1Selected
                              ? 'assets/images/dot_test_unselect.png'
                              : 'assets/images/dot_test_que_2.png',
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const TitleText(
                          text: 'Que thử thai',
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: grey600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                rose600.withOpacity(
                                    ((test1Selected && quetrung > 0) ||
                                            (test2Selected && quethai > 0))
                                        ? 1
                                        : 0.6),
                                rose400.withOpacity(
                                    ((test1Selected && quetrung > 0) ||
                                            (test2Selected && quethai > 0))
                                        ? 1
                                        : 0.6),
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
                            if (test1Selected) {
                              if (quetrung > 0) {
                                Navigator.pushNamed(
                                  context,
                                  ImageAnalyzeScreen.routeName,
                                  arguments: {
                                    'maQuanLyQueTest':
                                        widget.quanLyQueTest.maQuanLyQueTest,
                                    'maLoaiQue': 1,
                                    'videos': widget.videos,
                                    'images': widget.images,
                                  },
                                );
                              }
                            } else if (test2Selected) {
                              bool? check =
                                  await requestThaiTest(context, size);
                              if (check == true) {
                                if (quethai > 0) {
                                  Navigator.pushNamed(
                                    context,
                                    ImageAnalyzeScreen.routeName,
                                    arguments: {
                                      'maQuanLyQueTest':
                                          widget.quanLyQueTest.maQuanLyQueTest,
                                      'maLoaiQue': 2,
                                      'videos': widget.videos,
                                      'images': widget.images,
                                    },
                                  );
                                }
                              }
                            }
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
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
                                size.height * 0.065,
                              ),
                            ),
                            //foregroundColor: MaterialStateProperty.all(roseTitleText),
                            textStyle: MaterialStateProperty.all(
                              PrimaryFont.semibold(16, FontWeight.w600)
                                  .copyWith(color: greyText),
                            ),
                          ),
                          child: const Text('Xác nhận'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Hủy',
                          style: PrimaryFont.semibold(
                            16,
                            FontWeight.w400,
                          ).copyWith(
                            decoration: TextDecoration.underline,
                            color: rose400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
