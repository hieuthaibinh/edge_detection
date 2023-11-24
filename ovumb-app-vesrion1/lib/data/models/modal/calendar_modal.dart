// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class CalendarModal {
  final String title;
  final String textButton;
  final Color beginColor;
  final Color endColor;
  final Color circle1;
  final Color circle2;
  final Color containerColor;
  final Color textColor;
  final String image;
  final String plus;
  CalendarModal({
    required this.title,
    required this.textButton,
    required this.beginColor,
    required this.endColor,
    required this.circle1,
    required this.circle2,
    required this.containerColor,
    required this.textColor,
    required this.image,
    required this.plus,
  });
}

List<CalendarModal> calendarModal = [
  CalendarModal(
    title: 'Khả Năng\nThụ Thai\nHiện Tại',
    textButton: 'THẤP',
    beginColor: pink800.withOpacity(0.3),
    endColor: pink500.withOpacity(0.3),
    circle1: pink300,
    circle2: pink200,
    containerColor: rose25,
    textColor: pink800,
    plus: 'assets/icons/calendar_add_icon.png',
    image: 'assets/images/bg_modal1.png',
  ),
  CalendarModal(
    title: 'Khả Năng\nThụ Thai\nHiện Tại',
    textButton: 'TRUNG BÌNH',
    beginColor: pink800.withOpacity(0.7),
    endColor: pink500.withOpacity(0.7),
    circle1: pink300,
    circle2: pink200,
    textColor: pink800,
    containerColor: rose25,
    plus: 'assets/icons/calendar_add_icon.png',
    image: 'assets/images/bg_modal1.png',
  ),
  CalendarModal(
    title: 'Khả Năng\nThụ Thai\nHiện Tại',
    textButton: 'CAO',
    beginColor: pink800,
    endColor: pink500,
    circle1: pink300,
    circle2: pink200,
    textColor: pink800,
    containerColor: rose25,
    plus: 'assets/icons/calendar_add_icon.png',
    image: 'assets/images/bg_modal1.png',
  ),
  CalendarModal(
    title: 'Dự Đoán\nQuan Hệ\nAn Toàn',
    textButton: 'TUYỆT ĐỐI',
    beginColor: Color(0xff4168F2),
    endColor: Color(0xff7BA0FF),
    circle1: Color(0xffBCC9FB),
    circle2: Color(0xffDAE2FD),
    containerColor: blue25,
    textColor: Color(0xff4168F2),
    plus: 'assets/icons/calendar_add_icon1.png',
    image: 'assets/images/bg_modal.png',
  ),
  CalendarModal(
    title: 'Dự Đoán\nQuan Hệ\nAn Toàn',
    textButton: 'TƯƠNG ĐỐI',
    beginColor: Color(0xff4168F2).withOpacity(0.5),
    endColor: Color(0xff7BA0FF).withOpacity(0.5),
    circle1: Color(0xffBCC9FB),
    circle2: Color(0xffDAE2FD),
    containerColor: blue25,
    textColor: Color(0xff4168F2),
    plus: 'assets/icons/calendar_add_icon1.png',
    image: 'assets/images/bg_modal.png',
  ),
];
