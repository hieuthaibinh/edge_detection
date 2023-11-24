// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_ovumb_app_version1/data/enum/test_enum.dart';

class DataManHuongDanTest {
  int id;
  String title;
  String describle;
  TestEnum testEnum;
  bool isCheck;

  DataManHuongDanTest(
    this.id,
    this.title,
    this.describle,
    this.testEnum,
    this.isCheck,
  );
}

List<DataManHuongDanTest> dataManHuongDanTest = [
  DataManHuongDanTest(
    0,
    'BƯỚC 1',
    'Nhúng que vào cốc đựng nước tiểu trong 30 giây. Sau đó, để que test nơi khô thoáng trong vòng 5 phút',
    TestEnum.video,
    false,
  ),
  DataManHuongDanTest(
    1,
    'BƯỚC 2',
    'Đặt que vào khay test',
    TestEnum.video,
    false,
  ),
  DataManHuongDanTest(
    2,
    'BƯỚC 3',
    'Đưa camera lên trước khay test để OvumB nhận diện ô test và chụp',
    TestEnum.video,
    false,
  ),
  DataManHuongDanTest(
    3,
    'BƯỚC 4',
    'Chọn dấu tick hoàn thành hoặc chụp lại nếu ô test chưa được nhận diện đúng',
    TestEnum.image,
    false,
  ),
  DataManHuongDanTest(
    4,
    'BƯỚC 5',
    'Nhận kết quả Test',
    TestEnum.image,
    true,
  ),
];
