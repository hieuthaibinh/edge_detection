// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/enum/checkbox_enum.dart';
import 'package:flutter_ovumb_app_version1/data/enum/nhatky_enum.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

//////////////////////////
///class model của listView checkbox
class Data {
  final List<String> detailTitle;
  final List<bool> checkbox;

  Data(
    this.detailTitle,
    this.checkbox,
  );
}

String celsius = "\u00B0";
List<Data> answer = [
  Data([], [false]), ///// work
  Data(['Rồi', 'Chưa'], [false, false]),
  Data(
    [
      'Không',
      'Chuột rút',
      'Đau đầu',
      'Đầy bụng',
      'Tiêu chảy',
      'Táo bón',
      'Đau ngực',
      'Tích nước',
      'Đau lưng',
      'Khác'
    ],
    [false, false, false, false, false, false, false, false, false, false],
  ),
  Data(
    [
      'Trắng',
      'Vàng',
      'Vàng-Xanh Lá',
      'Xám',
      'Nâu',
      'Mùi tanh',
      'Nhiều dịch',
      'Đặc sệt'
    ],
    [false, false, false, false, false, false, false, false],
  ),
  Data(
    [
      'Không',
      'Đau vùng bụng',
      'Đau ngực',
      'Tăng nhiệt độ cơ thể',
      'Tăng ham muốn tình dục',
      'Mệt mỏi',
      'Chảy máu trong ngày rụng trứng',
      'Khác'
    ],
    [false, false, false, false, false, false, false, false],
  ),
  Data(
    [
      'Khô',
      'Dính',
      'Trắng sữa',
      'Khí hư',
      'Lòng trắng trứng',
      'Màu bất thường (vàng, nâu,...)',
    ],
    [false, false, false, false, false, false],
  ),
  Data(
    [
      'Vui vẻ',
      'Bình tĩnh',
      'Chán nản',
      'Bực tức',
      'Căng thẳng',
      'Dễ xúc động',
      'Lo âu',
    ],
    [false, false, false, false, false, false, false],
  ),
  Data(
    [
      'Không',
      'Kích thích rụng trứng',
      'Thuốc Hormone',
      'Thuốc tránh thai',
      'Thuốc giảm đau',
      'Khác',
    ],
    [false, false, false, false, false, false],
  ),
];

Data answerLuongKinh = Data(
  ['Không có', 'Ít', 'Trung bình', 'Nhiều'],
  [false, false, false, false],
);

//////////////////////////////////
///class model của listview nhật ký
class DataModel {
  final String title;
  List<String> subtitle;
  NhatKyEnum type;
  CheckboxEnum checkboxType;

  DataModel(
    this.title,
    this.subtitle,
    this.type,
    this.checkboxType,
  );
}

DataModel questionLuongKinh =
    DataModel('Lượng kinh', [], NhatKyEnum.radiobutton, CheckboxEnum.normal);

List<DataModel> question = [
  DataModel(
      'Nhiệt độ cơ thể bạn (℃)', [], NhatKyEnum.normal, CheckboxEnum.normal),
  DataModel('Bạn có quan hệ tình dục vào ngày hôm nay?', [],
      NhatKyEnum.radiobutton, CheckboxEnum.normal),
  DataModel('Cơ thể bạn có những triệu chứng lạ?', [], NhatKyEnum.checkbox,
      CheckboxEnum.special),
  DataModel('Khí hư của bạn có bất thường?', [], NhatKyEnum.checkbox,
      CheckboxEnum.normal),
  DataModel('Bạn có dấu hiệu rụng trứng không?', [], NhatKyEnum.checkbox,
      CheckboxEnum.special),
  DataModel('Dịch nhầy tử cung của bạn như thế nào?', [],
      NhatKyEnum.radiobutton, CheckboxEnum.normal),
  DataModel('Tâm trạng hôm nay của bạn thế nào?', [], NhatKyEnum.checkbox,
      CheckboxEnum.normal),
  DataModel('Bạn có uống thuốc ngày hôm nay?', [], NhatKyEnum.checkbox,
      CheckboxEnum.special),
];

/////////////////////
///class đồng hồ đo nhiệt độ cuộn cuộn
class DetailsPickerIntNumber extends StatelessWidget {
  int intNumber;

  DetailsPickerIntNumber({required this.intNumber});

  @override
  Widget build(BuildContext context) {
    return Text(
      (intNumber + 35).toString(),
      style: const TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: Palette.textColor),
    );
  }
}

class DayPickerIntNumber extends StatelessWidget {
  int intNumber;
  String subtext;

  DayPickerIntNumber({
    Key? key,
    required this.intNumber,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: rose25,
      child: Center(
        child: Text(
          intNumber.toString() + subtext,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Palette.textColor,
          ),
        ),
      ),
    );
  }
}

class DetailsPickerDoubleNumber extends StatelessWidget {
  int doubleNumber;

  DetailsPickerDoubleNumber({required this.doubleNumber});

  @override
  Widget build(BuildContext context) {
    return Text(
      '.' + doubleNumber.toString(),
      style: const TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: Palette.textColor),
    );
  }
}

class DetailsPickerBuMeNumber extends StatelessWidget {
  int intNumber;

  DetailsPickerBuMeNumber({required this.intNumber});

  @override
  Widget build(BuildContext context) {
    return Text(
      intNumber.toString(),
      style: const TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: Palette.textColor),
    );
  }
}
