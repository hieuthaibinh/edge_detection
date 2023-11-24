// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class DataChoAn {
  int id;
  bool isClick1;
  bool isClick2;
  final String title1;
  final String title2;
  final double? width;
  Color color;
  final String title;
  final String descripble;
  final String unit;
  final String type;
  double ml;

  DataChoAn(
    this.id,
    this.isClick1,
    this.isClick2,
    this.title1,
    this.title2,
    this.width,
    this.color,
    this.title,
    this.descripble,
    this.unit,
    this.type,
    this.ml,
  );
}

List<DataChoAn> dataChoAn = [
  DataChoAn(
    0,
    false,
    false,
    'Cho ăn',
    'Bú Mẹ',
    100,
    Color(0xffFD6F8E),
    'Cho con bú mẹ',
    'Ngực phải\n',
    'ml',
    ' sữa',
    100,
  ),
  DataChoAn(
    1,
    false,
    false,
    'Phát triển',
    'Bú Bình',
    100,
    Color(0xff4168F2),
    'Cho con bú bình',
    'Sữa công thức\n',
    'ml',
    ' sữa',
    120,
  ),
  DataChoAn(
    2,
    false,
    false,
    'Triệu chứng',
    'Bú bình',
    100,
    Color(0xffF3B975),
    'Cho con bú bình',
    'Sữa mẹ\n',
    'ml',
    ' sữa',
    120,
  ),
  DataChoAn(
    2,
    false,
    false,
    'Triệu chứng',
    'Ăn Dặm',
    110,
    Color(0xff2EB6BE),
    'Cho con ăn dặm',
    'Bột ăn dặm\n',
    'gam',
    ' đồ ăn dặm',
    50,
  ),
];

class DataNhapDuLieu {
  String title;
  String descripble;
  DataNhapDuLieu(this.title, this.descripble);
}

List<DataNhapDuLieu> dataNhapDuLieu = [
  DataNhapDuLieu(
    'Cho con bú mẹ',
    'Chạm vào 1 trong hai bên ngực để bắt đầu\ntính thời gian cho con bú',
  ),
  DataNhapDuLieu(
    'Cho con bú bình',
    'Kéo ngưỡng sữa trong bình dưới bằng với ngưỡng sữa cho con bú',
  ),
  DataNhapDuLieu(
    'Cho con ăn dặm',
    'Kéo ngưỡng sữa trong bình dưới bằng với ngưỡng sữa cho con bú',
  )
];

class DataBuMe {
  String title;
  Color colorWave;
  Color colorBackground;
  double value;
  bool isPlaying;
  String second;
  String minus;
  int ml;
  int totalMl;
  String textButton;
  String iconButton;
  bool isReload;
  bool isNavigatorPush = true;
  bool isChinhSua = false;

  DataBuMe(
    this.title,
    this.colorWave,
    this.colorBackground,
    this.value,
    this.isPlaying,
    this.second,
    this.minus,
    this.ml,
    this.totalMl,
    this.textButton,
    this.iconButton,
    this.isReload,
    this.isChinhSua,
  );
}

List<DataBuMe> dataBuMe = [
  DataBuMe(
    'Trái',
    violet500,
    violet100,
    0.25,
    false,
    '00',
    '00',
    100,
    0,
    'Chỉnh sửa',
    'assets/images/pencil.png',
    false,
    false,
  ),
  DataBuMe(
    'Phải',
    rose400,
    rose100,
    0.8,
    false,
    '00',
    '00',
    50,
    0,
    'Làm mới',
    'assets/images/refresh.png',
    false,
    false,
  ),
];

class DataBuBinh {
  int id;
  bool isClick;
  String title;
  double value;
  TextEditingController controller;

  DataBuBinh(
    this.id,
    this.isClick,
    this.title,
    this.value,
    this.controller,
  );
}

List<DataBuBinh> dataBuBinh = [
  DataBuBinh(
    1,
    true,
    'Sữa công thức',
    0,
    TextEditingController(text: '0'),
  ),
  DataBuBinh(
    0,
    false,
    'Sữa mẹ',
    0,
    TextEditingController(text: '0'),
  ),
  DataBuBinh(
    0,
    false,
    'Sữa mẹ',
    0,
    TextEditingController(text: '0'),
  ),
  DataBuBinh(
    0,
    false,
    'Sữa mẹ',
    0,
    TextEditingController(text: '0'),
  ),
];

List<DataBuBinh> dataKichSua = [
  DataBuBinh(
    1,
    true,
    'Ngực trái',
    0,
    TextEditingController(text: '0'),
  ),
  DataBuBinh(
    0,
    false,
    'Ngực phải',
    0,
    TextEditingController(text: '0'),
  ),
];

class DataAnDam {
  int index;
  String image;
  String title;
  int gram;
  bool isAdd;
  TextEditingController controller;
  double totalAnDam;

  DataAnDam(
    this.index,
    this.image,
    this.title,
    this.gram,
    this.isAdd,
    this.controller,
    this.totalAnDam,
  );
}

List<DataAnDam> dataAnDam = [
  DataAnDam(
    0,
    'assets/images/donhuyen.png',
    'Đồ nhuyễn',
    50,
    false,
    TextEditingController(),
    0,
  ),
  DataAnDam(
    1,
    'assets/images/dam.png',
    'Đạm',
    50,
    false,
    TextEditingController(),
    0,
  ),
  DataAnDam(
    2,
    'assets/images/rau.png',
    'Rau quả',
    50,
    false,
    TextEditingController(),
    0,
  ),
  DataAnDam(
    3,
    'assets/images/tinhbot.png',
    'Tinh bột',
    50,
    false,
    TextEditingController(),
    0,
  ),
  DataAnDam(
    4,
    'assets/images/hat.png',
    'Hạt',
    50,
    false,
    TextEditingController(),
    0,
  ),
  DataAnDam(
    5,
    'assets/images/khac.png',
    'Khác',
    50,
    false,
    TextEditingController(),
    0,
  ),
];

class ListChartData {
  List<int> chartBuMe;

  ListChartData(
    this.chartBuMe,
  );
}

// []  {}

class Sound {
  bool isPlaying;
  AudioPlayer player;
  Sound(
    this.isPlaying,
    this.player,
  );
}

List<Sound> sound = [
  Sound(
    false,
    AudioPlayer(),
  ),
];
