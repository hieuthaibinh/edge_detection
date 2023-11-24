import 'package:flutter/material.dart';

class DataPhatTrien {
  bool isXacNhan;
  String image;
  double minNumber;
  double maxNumber;

  DataPhatTrien(
    this.isXacNhan,
    this.image,
    this.minNumber,
    this.maxNumber,
  );
}

List<DataPhatTrien> dataPhatTrien = [
  DataPhatTrien(
    false,
    'assets/images/weight.png',
    2,
    20,
  ),
  DataPhatTrien(
    false,
    'assets/images/height.png',
    50,
    150,
  ),
];

class DataBangChiTiet {
  double cannang;
  double chieucao;
  String phattrien;

  DataBangChiTiet(
    this.cannang,
    this.chieucao,
    this.phattrien,
  );
}

List<DataBangChiTiet> dataBangChiTiet = [
  DataBangChiTiet(0, 0, 'Bình thường'),
  DataBangChiTiet(0, 0, 'Bình thường'),
  DataBangChiTiet(0, 0, 'Bình thường'),
  DataBangChiTiet(0, 0, 'Bình thường'),
];

class DataPhatTrienChiTiet {
  double width;
  Color color;
  String thetrang;

  DataPhatTrienChiTiet(this.width, this.color, this.thetrang);
}

List<DataPhatTrienChiTiet> dataPhatTrienChiTiet = [
  DataPhatTrienChiTiet(
    45,
    Color(0xff8263FF),
    'Gầy cấp độ 2',
  ),
  DataPhatTrienChiTiet(
    90,
    Color(0xff4A85F8),
    'Gầy cấp độ 1',
  ),
  DataPhatTrienChiTiet(
    55,
    Color(0xff61D3CD),
    'Bình thường',
  ),
  DataPhatTrienChiTiet(
    89,
    Color(0xffFFA563),
    'Béo cấp độ 1',
  ),
  DataPhatTrienChiTiet(
    89,
    Color(0xffFF636C),
    'Béo cấp độ 2',
  ),
];
