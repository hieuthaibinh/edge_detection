// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bmi/bmi_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/FAQ/faq_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/profile/profile_edit_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/profile/widgets/profile_container_box.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/man_huong_dan/man_huong_dan_test_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/logo_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_update_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/sub_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../../../logic/bloc/main/main_bloc.dart';
import '../../../../logic/bloc/main/main_state.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile-screen';
  final GlobalKey<ScaffoldState> scaffoldKey;
  const ProfileScreen({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Thông Tin Cá Nhân',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: rose500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => widget.scaffoldKey.currentState!.openEndDrawer(),
            icon: Image.asset(
              'assets/icons/right_home_icon.png',
              scale: 3,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is ProfileState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SubText(
                                      text: 'Xin Chào',
                                      size: 16,
                                      color: grey700,
                                    ),
                                    TitleText(
                                      text: state.nguoiDung.tenNguoiDung,
                                      fontWeight: FontWeight.w700,
                                      size: 20,
                                      color: grey700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ProfileEditScreen.routeName,
                                    arguments: state.nguoiDung,
                                  );
                                },
                                child: Image.asset(
                                  'assets/icons/edit_icon.png',
                                  scale: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              rose400,
                              rose300,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TitleText(
                                          text: 'Cân nặng',
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: whiteColor,
                                        ),
                                        TitleText(
                                          text: state.nguoiDung.canNang == null
                                              ? '--'
                                              : state.nguoiDung.canNang
                                                      .toString() +
                                                  'kg',
                                          fontWeight: FontWeight.w300,
                                          size: 12,
                                          color: whiteColor,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TitleText(
                                          text: 'Chiều cao',
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: whiteColor,
                                        ),
                                        TitleText(
                                          text: state.nguoiDung.chieuCao == null
                                              ? '--'
                                              : state.nguoiDung.chieuCao
                                                      .toString() +
                                                  'cm',
                                          fontWeight: FontWeight.w300,
                                          size: 12,
                                          color: whiteColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    const VerticalDivider(
                                      color: whiteColor,
                                      width: 3,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const TitleText(
                                              text: 'BMI',
                                              fontWeight: FontWeight.w700,
                                              size: 18,
                                              color: whiteColor,
                                            ),
                                            TitleText(
                                              text: state.nguoiDung.canNang ==
                                                      null
                                                  ? '--'
                                                  : BMI
                                                      .calculateBMI(
                                                        state
                                                            .nguoiDung.canNang!,
                                                        state.nguoiDung
                                                            .chieuCao!,
                                                      )
                                                      .toString(),
                                              fontWeight: FontWeight.w300,
                                              size: 12,
                                              color: whiteColor,
                                            ),
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Đánh giá: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: whiteColor,
                                                ),
                                              ),
                                              TextSpan(
                                                text: state.nguoiDung.canNang ==
                                                        null
                                                    ? '--'
                                                    : BMI
                                                        .evaluateBMI(
                                                            BMI.calculateBMI(
                                                          state.nguoiDung
                                                              .canNang!,
                                                          state.nguoiDung
                                                              .chieuCao!,
                                                        ))
                                                        .result,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          height: 1,
                          color: grey300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            QuestionUpdateScreen.routeName,
                            arguments: state.kinhNguyetCurrent,
                          ),
                          child: const SizedBox(
                            height: 50,
                            child: ProfileBoxContainer(
                              leftIcon:
                                  'assets/icons/hand_holding_heart_icon.png',
                              title: 'Thông tin sức khỏe',
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 14),
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.pushNamed(context, ReminderScreen.routeName);
                      //     },
                      //     child: const SizedBox(
                      //       height: 50,
                      //       child: ProfileBoxContainer(
                      //         leftIcon: 'assets/icons/bell_icon.png',
                      //         title: 'Nhắc nhở quan trọng',
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pushNamed(context, FAQScreen.routeName);
                          },
                          child: const SizedBox(
                            height: 50,
                            child: ProfileBoxContainer(
                              leftIcon: 'assets/icons/interrogation_icon.png',
                              title: 'Câu hỏi thường gặp',
                            ),
                          ),
                        ),
                      ),
                      if (state.nguoiDung.phase != 5) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ManHuongDanTestScreen.routeName);
                            },
                            child: const SizedBox(
                              height: 50,
                              child: ProfileBoxContainer(
                                leftIcon: 'assets/icons/marquee_icon.png',
                                title: 'Hướng dẫn Test',
                              ),
                            ),
                          ),
                        ),
                      ],

                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(26),
                              ),
                            ),
                            isScrollControlled: true,
                            barrierColor: grey900.withOpacity(0.4),
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(26),
                                      topRight: Radius.circular(26),
                                    ),
                                  ),
                                  height: 280,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 40,
                                        horizontal: 20,
                                      ),
                                      child: Column(
                                        children: [
                                          const TitleText(
                                            text: 'Đăng Xuất',
                                            fontWeight: FontWeight.w700,
                                            size: 18,
                                            color: rose500,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 70),
                                            child: Text(
                                              'Bạn có chắc chắn đăng xuất khỏi tài khoản này không?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      rose25,
                                                      rose25,
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(38),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              38),
                                                    )),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(0),
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      Size(
                                                        screenSize.width * 0.4,
                                                        screenSize.height *
                                                            0.06,
                                                      ),
                                                    ),
                                                    //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                  ),
                                                  child: Text(
                                                    'Quay lại',
                                                    style: PrimaryFont.semibold(
                                                            16, FontWeight.w600)
                                                        .copyWith(
                                                      color: rose400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      rose500,
                                                      rose300,
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(38),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    BlocProvider.of<AuthBloc>(
                                                            context)
                                                        .add(AuthEventLogout());
                                                    await Future.delayed(
                                                        Duration(
                                                            milliseconds: 300));
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            LogoScreen
                                                                .routeName,
                                                            (route) => false);
                                                  },
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              38),
                                                    )),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(0),
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      Size(
                                                        screenSize.width * 0.4,
                                                        screenSize.height *
                                                            0.06,
                                                      ),
                                                    ),
                                                    //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                  ),
                                                  child: Text(
                                                    'Xác nhận',
                                                    style: PrimaryFont.semibold(
                                                            16, FontWeight.w600)
                                                        .copyWith(
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/sign_out_icon.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Đăng xuất',
                              style: PrimaryFont.semibold(
                                14,
                                FontWeight.w600,
                              ).copyWith(
                                color: rose400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
