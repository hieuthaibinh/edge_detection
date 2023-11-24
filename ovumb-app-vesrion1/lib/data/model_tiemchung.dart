import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class TextTiemChung {
  String image;
  String text1;
  Color numberColor;
  String text2;
  bool isClick;

  TextTiemChung(
    this.image,
    this.text1,
    this.numberColor,
    this.text2,
    this.isClick,
  );
}

List<TextTiemChung> textTiemChung = [
  TextTiemChung(
    'assets/images/done.png',
    'Bé đã được tiêm ',
    Color(0xff04C1C1),
    ' mũi trong tháng',
    false,
  ),
  TextTiemChung(
    'assets/images/done1.png',
    'Bé cần tiêm ',
    rose500,
    ' mũi nữa trong tháng',
    false,
  ),
];

class DataTiemchung {
  int id;
  double height;
  double width;
  Color color;
  bool isCheckbox;
  TextEditingController controller;

  DataTiemchung(
    this.id,
    this.height,
    this.width,
    this.color,
    this.isCheckbox,
    this.controller,
  );
}

List<DataTiemchung> tiemchung = [
  DataTiemchung(
    0,
    100,
    300,
    Color(0xff6F7DFD),
    false,
    TextEditingController(),
  ),
  DataTiemchung(
    1,
    100,
    300,
    Color(0xffC76FFD),
    false,
    TextEditingController(),
  ),
  DataTiemchung(
    2,
    100,
    300,
    Color(0xffFD6F8E),
    false,
    TextEditingController(),
  ),
];

class DataMuiTiem {
  String name;
  int somuidatiem;
  List<TextEditingController> textEditingController;
  List<bool> isCheckbox;
  DataMuiTiem(
    this.name,
    this.somuidatiem,
    this.textEditingController,
    this.isCheckbox,
  );
}

List<DataMuiTiem> dataMuiTiem = [
  // widgetId
  DataMuiTiem(
    //0
    'Viêm gan B (HBV)',
    4,
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //1
    'Lao',
    1,
    [
      TextEditingController(),
    ],
    [
      false,
    ],
  ),
  DataMuiTiem(
    //2
    'Rota',
    3,
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //3
    '5 in1 hoặc 6 in 1',
    4,
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //4
    'Phế cầu',
    4,
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //5
    'Cúm mùa',
    2,
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //6
    'Viêm màng não BC',
    2,
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //7
    'Sởi - Quai bị - Rubella',
    2,
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //8
    'Viêm não Nhật Bản B',
    3,
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //9
    'Thủy đậu',
    2,
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //10
    'viêm gan A',
    2,
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
  ),
  DataMuiTiem(
    //11
    'Viêm màng não AC',
    1,
    [
      TextEditingController(),
    ],
    [
      false,
    ],
  ),
  DataMuiTiem(
    //12
    'Thương hàn',
    1,
    [
      TextEditingController(),
    ],
    [
      false,
    ],
  ),
];

class ThangTiemChung {
  int id;
  String image;
  int somuidatiem;
  bool isShow;
  List<DataTiemchung> tiemchung;
  List<Color> color;
  List<String> title;
  List<String> descripble;
  List<TextEditingController> textEditingController;
  List<bool> isCheckbox;
  List<int> idCheckbox;
  DateTime month;
  List<bool> countTrueValue;
  ThangTiemChung(
    this.id,
    this.image,
    this.somuidatiem,
    this.isShow, //value của ô tháng
    this.tiemchung,
    this.color,
    this.title,
    this.descripble,
    this.textEditingController,
    this.isCheckbox, //value của ô chọn mũi tiêm checkbox
    this.idCheckbox, // so thu tu cua o chon mui tiem checkbox
    this.month,
    this.countTrueValue,
  );
}

List<ThangTiemChung> thangTiemChung = [
  ThangTiemChung(
    0,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
      Color(0xffC76FFD),
    ],
    [
      dataMuiTiem[0].name,
      dataMuiTiem[1].name,
    ],
    [
      'Tiêm chủng 1',
      'Tiêm chủng 2',
    ],
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
    [
      0,
      1,
    ],
    DateTime.now().add(Duration(days: 0)),
    [],
  ),
  ThangTiemChung(
    1,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
      Color(0xffC76FFD),
      Color(0xff6F7DFD),
      Color(0xffFD6F8E),
    ],
    [
      dataMuiTiem[0].name,
      dataMuiTiem[2].name,
      dataMuiTiem[3].name,
      dataMuiTiem[4].name,
    ],
    [
      'Tiêm chủng 1',
      'Tiêm chủng 2',
      'Tiêm chủng 3',
      'Tiêm chủng 3',
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
      false,
    ],
    [
      0,
      1,
      2,
      3,
    ],
    DateTime.now().add(Duration(days: 30)),
    [],
  ),
  ThangTiemChung(
    2,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
      Color(0xffC76FFD),
      Color(0xff6F7DFD),
    ],
    [
      dataMuiTiem[0].name,
      dataMuiTiem[2].name,
      dataMuiTiem[3].name,
    ],
    [
      'Tiêm chủng 1',
      'Tiêm chủng 2',
      'Tiêm chủng 3',
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
    ],
    [
      0,
      1,
      2,
    ],
    DateTime.now().add(Duration(days: 60)),
    [],
  ),
  ThangTiemChung(
    3,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
      Color(0xffC76FFD),
      Color(0xff6F7DFD),
    ],
    [
      dataMuiTiem[2].name,
      dataMuiTiem[3].name,
      dataMuiTiem[4].name,
    ],
    [
      'Tiêm chủng 1',
      'Tiêm chủng 2',
      'Tiêm chủng 3',
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
      false,
    ],
    [
      0,
      1,
      2,
    ],
    DateTime.now().add(Duration(days: 90)),
    [],
  ),
  ThangTiemChung(
    4,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
    ],
    [
      dataMuiTiem[4].name,
    ],
    [
      'Tiêm chủng 1',
    ],
    [
      TextEditingController(),
    ],
    [
      false,
    ],
    [
      0,
    ],
    DateTime.now().add(Duration(days: 120)),
    [],
  ),
  ThangTiemChung(
    5,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
      Color(0xffC76FFD),
    ],
    [
      dataMuiTiem[5].name,
      dataMuiTiem[6].name,
    ],
    [
      'Tiêm chủng 1',
      'Tiêm chủng 2',
    ],
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      false,
      false,
    ],
    [
      0,
      1,
    ],
    DateTime.now().add(Duration(days: 150)),
    [],
  ),
  ThangTiemChung(
    6,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
    ],
    [
      dataMuiTiem[5].name,
    ],
    [
      'Tiêm chủng 1',
    ],
    [
      TextEditingController(),
    ],
    [
      false,
    ],
    [
      0,
    ],
    DateTime.now().add(Duration(days: 180)),
    [],
  ),
  ThangTiemChung(
    7,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
    ],
    [
      dataMuiTiem[6].name,
    ],
    [
      'Tiêm chủng 1',
    ],
    [
      TextEditingController(),
    ],
    [
      false,
    ],
    [
      0,
    ],
    DateTime.now().add(Duration(days: 210)),
    [],
  ),
  ThangTiemChung(
    8,
    '',
    0,
    false,
    tiemchung,
    [
      Color(0xffFD6F8E),
    ],
    [
      dataMuiTiem[4].name,
    ],
    [
      'Tiêm chủng 1',
    ],
    [
      TextEditingController(),
    ],
    [
      false,
    ],
    [
      0,
    ],
    DateTime.now().add(Duration(days: 240)),
    [],
  ),
];
