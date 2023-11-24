// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

final colorDatDinh = [
  rose200,
  rose500,
];

final colorCao = [
  rose200,
  rose400,
];

final colorThap = [
  rose200,
  rose300,
];

TestResult testResultFailure = TestResult(
  maKetQuaTest: 0,
  backgroundColor: '0xFFFFFFFF',
  imageUrl: 'assets/images/result_test_fail.png',
  titleText: 'Test Bị Gián Đoạn',
  subText:
      'Tiến độ test bị gián đoạn do mất kết nối đến Internet. Bạn hãy kiểm tra và thử lại sau khi ổn định kết nối.',
  textColor: '0xFFFD6F8E',
  progressColor: '0xFFFD6F8E',
  type: 0,
  testEnum: 0,
  imageType: 0,
  phase: 1,
  isBefore: 0,
  notification: '',
  titleNotification: '',
);

TestResult testScanFailure = TestResult(
  maKetQuaTest: 0,
  backgroundColor: '0xFFFFFFFF',
  imageUrl: 'assets/images/result_test_fail1.png',
  titleText: 'Hình Ảnh Không Hợp Lệ',
  subText:
      'Tiến độ test bị gián đoạn do hình ảnh chụp có thể bị mờ dẫn đến kết quả không chính xác. Vui lòng thử lại kết quả.',
  textColor: '0xFFFD6F8E',
  progressColor: '0xFFFD6F8E',
  type: 0,
  testEnum: 0,
  imageType: 0,
  phase: 1,
  isBefore: 0,
  notification: '',
  titleNotification: '',

);
