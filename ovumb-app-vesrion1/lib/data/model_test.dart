//class listview bán sản phẩm
import 'package:flutter/material.dart';

class DataTest {
  int id;
  String imageAsset;
  String name;
  String price;

  DataTest(this.id, this.imageAsset, this.name, this.price);
}

List<DataTest> dataTest = [
  DataTest(0, 'assets/images/ovumb.png', '1 hộp OvumB', '499.000đ'),
  DataTest(0, 'assets/images/ovumb1.png', '3 hộp OvumB', 'Liên hệ'),
  DataTest(0, 'assets/images/ovumb1.png', '5 hộp OvumB', 'Liên hệ'),
];

class DataMeVaBe {
  int id;
  String title;
  String imageAsset;
  String name;
  String price;
  Color color;
  String link;

  DataMeVaBe(
    this.id,
    this.title,
    this.imageAsset,
    this.name,
    this.price,
    this.color,
    this.link,
  );
}

List<DataMeVaBe> dataMeVaBe1 = [
  DataMeVaBe(
    0,
    'Thực phẩm bổ sung',
    'assets/images/mebe4.png',
    'WellVita Mom',
    '490.000₫',
    Color(0xffEFECFF),
    'https://espharma.vn/wellvita-mom/',
  ),
  DataMeVaBe(
    0,
    'Thực phẩm bổ sung',
    'assets/images/sat.png',
    'Feroglobin',
    '385.000₫',
    Color(0xffFFEAEA),
    'https://sinhcontheoymuon.vn/feroglobin-bo-sung-sat/',
  ),
  DataMeVaBe(
    0,
    'Thực phẩm bổ sung',
    'assets/images/mebe3.png',
    'Ngũ cốc đặc sữa',
    '285.000₫',
    Color(0xffF5FFEC),
    'https://espharma.vn/ngu-coc-dac-sua-nhu-y/',
  ),
  DataMeVaBe(
    0,
    'Thực phẩm bổ sung',
    'assets/images/bau1.png',
    'Preg. Max',
    '355.000₫',
    Color(0xffECFBF3),
    '',
  ),
  DataMeVaBe(
    0,
    'Thực phẩm bổ sung',
    'assets/images/bau2.png',
    'Preg. Original',
    '699.000đ',
    Color(0xffECFBF3),
    '',
  ),
];

List<DataMeVaBe> dataMeVaBe2 = [
  DataMeVaBe(
    0,
    'Hành Trang Đón Bé',
    'assets/images/mebe1.png',
    'Cao trà IMA',
    '390.000₫',
    Color(0xffF9FFEC),
    'https://espharma.vn/cao-tra-ima-hop-20-goi/',
  ),
  DataMeVaBe(
    0,
    'Hành Trang Đón Bé',
    'assets/images/mebe2.png',
    'Gạc rơ lưỡi Emtis',
    '90.000đ',
    Color(0xffECF8FF),
    'https://espharma.vn/gac-ro-luoi-emtis/',
  ),
  DataMeVaBe(
    0,
    'Hành Trang Đón Bé',
    'assets/images/mebe3.png',
    'Ngũ cốc đặc sữa',
    '285.000₫',
    Color(0xffF5FFEC),
    'https://espharma.vn/ngu-coc-dac-sua-nhu-y/',
  ),
  DataMeVaBe(
    0,
    'Hành Trang Đón Bé',
    'assets/images/mebe4.png',
    'WellVita Mom',
    '490.000₫',
    Color(0xffEFECFF),
    'https://espharma.vn/wellvita-mom/',
  ),
];

//class percent_indicator vòng tròn
class DataTestPercent {
  int id;
  String useOvumb;
  String totalOvumb;
  LinearGradient progressColor;

  DataTestPercent(this.id, this.useOvumb, this.totalOvumb, this.progressColor);
}

List<DataTestPercent> dataTestPercent = [
  DataTestPercent(0, '20 Test', '/24 Test',
      const LinearGradient(colors: [Color(0xff6941c6), Color(0xffb692f6)])),
  DataTestPercent(1, '2 Test', '/4 Test',
      const LinearGradient(colors: [Color(0xff008E75), Color(0xff0AB092)])),
];

//class mô tả percent_indicator
class DataTestNote {
  int id;
  String title;
  String describe;

  DataTestNote(this.id, this.title, this.describe);
}

List<DataTestNote> dataTestNote = [
  DataTestNote(0, 'Số lần Test', 'Rụng trứng'),
  DataTestNote(1, 'Số lần Test', 'Thử thai'),
];
