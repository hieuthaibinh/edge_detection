// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan3_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class Tuvan2Screen extends StatefulWidget {
  static const routeName = 'tuvan2-screen';
  final int phase;
  const Tuvan2Screen({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  State<Tuvan2Screen> createState() => _Tuvan2ScreenState();
}

class _Tuvan2ScreenState extends State<Tuvan2Screen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: GlobalDrawer(
        size: screenSize,
        scaffoldKey: scaffoldKey,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        title: Align(
          alignment: Alignment.center,
          child: TitleText(
            text: 'Chuyên Gia Tư Vấn',
            fontWeight: FontWeight.w600,
            size: 18,
            color: rose500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back_button.png',
            scale: 3,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
            icon: Image.asset(
              'assets/icons/right_home_icon.png',
              scale: 3,
            ),
          ),
        ],
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Container(
          color: const Color(0xffffe4e8),

          ///
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  alignment: Alignment.bottomCenter,
                  //color: Colors.green,
                  height: screenHeight / 1.8, //388,
                  child: Image.asset('assets/images/doctor10.png'),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.4),
                  alignment: Alignment.bottomCenter,
                  //color: Colors.yellow,
                  height: screenHeight * 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.amber,
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.05,
                              left: screenWidth * 0.1,
                              right: screenWidth * 0.1),
                          height: screenHeight * 0.2,
                          width: screenWidth,

                          child: const Text(
                            'Nhận tư vấn từ\nChuyên gia sinh sản\ncủa OvumB',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff344054),
                              decoration: TextDecoration.none,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.005,
                              left: screenWidth * 0.1,
                              right: screenWidth * 0.1),
                          //color: Colors.green,
                          height: screenHeight * 0.1,
                          width: screenWidth,

                          child: const Text(
                            'Với nhiều năm kinh nghiệm, chuyên gia sinh sản của OvumB sẵn sàng đồng hành cùng bạn 24/7',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Palette.text,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.06,
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.015,
                              left: screenWidth * 0.1,
                              right: screenWidth * 0.1),
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
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                screenWidth * 0.9,
                                screenHeight * 0.06,
                              ),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              context
                                  .read<MainBloc>()
                                  .add(TvvEvent(phase: widget.phase));
                              Navigator.pushNamed(
                                  context, Tuvan3Screen.routeName);
                            },
                            child: const Text(
                              'Tiếp tục',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
