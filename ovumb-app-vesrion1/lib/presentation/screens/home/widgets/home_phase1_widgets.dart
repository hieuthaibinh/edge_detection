import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/constant/constant.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_full_container.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_full_container1.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_half_container.dart';

Widget containerKienThucSinhSanHalf = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xff72389E),
    gradientTo: Color(0xff9E77ED),
    title: PHASE2_HOME_BUTTON1_TITILE,
    sub: PHASE2_HOME_BUTTON1_SUB_TITILE,
    image: 'assets/images/doctor1.png',
    beginGradient: Alignment.bottomCenter,
    endGradient: Alignment.topCenter,
  ),
);

Widget containerHoiConTrai = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xff3988FF),
    gradientTo: Color(0xff84C4FE),
    title: 'Cộng đồng săn\nQuý Tử',
    sub: 'Tham gia Miễn Phí',
    image: 'assets/images/quytu.png',
    beginGradient: Alignment.centerLeft,
    endGradient: Alignment.centerRight,
  ),
);

Widget containerHoiConGai = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xffFD6F8E),
    gradientTo: Color(0xffFECDD6),
    title: 'Cộng đồng săn\nCông Chúa',
    sub: 'Tham gia Miễn Phí',
    image: 'assets/images/congchua.png',
    beginGradient: Alignment.centerLeft,
    endGradient: Alignment.centerRight,
  ),
);

Widget containerNhatKy = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeFullContainer(
    image: 'assets/images/diary1.png',
    title: 'Hoàn tất nhật ký về cơ thể của bạn',
    sub: getDateTime(),
    fromColor: const Color(0xffe31b54),
    toColor: const Color(0xfffea3b4),
    textColor: Colors.white,
    directFrom: Alignment.centerLeft,
    directTo: Alignment.centerRight,
  ),
);

Widget containerQuanLyQueTest = HomeFullContainer1(
  title: 'Quản lý que test',
  sub: 'Quản lý số lượng que test hiện tại và bổ sung khi cần thiết',
  image: 'assets/images/hoptest_antoan.png',
  fromColor: Color(0xffF63D68),
  toColor: Color(0xffFD6F8E),
  textColor: Colors.white,
  directFrom: Alignment.bottomCenter,
  directTo: Alignment.topCenter,
);

Widget containerKienThucSinhSan = HomeFullContainer1(
  title: PHASE2_HOME_BUTTON1_TITILE,
  sub: PHASE1_HOME_BUTTON1_SUB_TITILE,
  textColor: Colors.white,
  fromColor: Color(0xff72389E),
  toColor: Color(0xff9E77ED),
  image: 'assets/images/doctor1.png',
  directFrom: Alignment.bottomCenter,
  directTo: Alignment.topCenter,
);

Widget containerCongDongAnToan = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xff4168F2),
    gradientTo: Color(0xffA4BDFF),
    title: 'Tham gia',
    sub: 'Cộng đồng Tính\nNgày An Toàn',
    image: 'assets/images/heart1.png',
    beginGradient: Alignment.bottomCenter,
    endGradient: Alignment.topCenter,
  ),
);

Widget containerBiQuyet = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xff72389E),
    gradientTo: Color(0xff9E77ED),
    title: PHASE5_HOME_BUTTON1_TITILE,
    sub: PHASE5_HOME_BUTTON1_SUB_TITILE,
    image: 'assets/images/book.png',
    beginGradient: Alignment.bottomCenter,
    endGradient: Alignment.topCenter,
  ),
);

Widget containerGDGT = Container(
  decoration: const BoxDecoration(color: Colors.transparent),
  child: HomeHalfContainer(
    gradientFrom: Color(0xff4168F2),
    gradientTo: Color(0xffA4BDFF),
    title: PHASE5_HOME_BUTTON2_TITILE,
    sub: PHASE5_HOME_BUTTON2_SUB_TITILE,
    image: 'assets/images/gender.png',
    beginGradient: Alignment.bottomCenter,
    endGradient: Alignment.topCenter,
  ),
);

Widget containerMeoHayTuoiDayThi = HomeFullContainer(
  title: 'Mẹo hay tuổi dậy thì',
  sub: 'Hướng dẫn chăm sóc kỳ dâu an toàn và tip skincare đơn giản',
  image: 'assets/images/heart2.png',
  fromColor: Color(0xff4168F2),
  toColor: Color(0xffA4BDFF),
  textColor: Colors.white,
  directFrom: Alignment.bottomCenter,
  directTo: Alignment.topCenter,
);