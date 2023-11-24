import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TestResult {
  final int maKetQuaTest;
  final String backgroundColor;
  final String imageUrl;
  final String titleText;
  final String subText;
  final String textColor;
  final String progressColor;
  final int testEnum;
  final int phase;
  final int type;
  final int isBefore;
  final String notification;
  final String titleNotification;
  final int imageType;
  TestResult({
    required this.maKetQuaTest,
    required this.backgroundColor,
    required this.imageUrl,
    required this.titleText,
    required this.subText,
    required this.textColor,
    required this.progressColor,
    required this.testEnum,
    required this.phase,
    required this.type,
    required this.isBefore,
    required this.notification,
    required this.titleNotification,
    required this.imageType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maKetQuaTest': maKetQuaTest,
      'backgroundColor': backgroundColor,
      'imageUrl': imageUrl,
      'titleText': titleText,
      'subText': subText,
      'textColor': textColor,
      'progressColor': progressColor,
      'testEnum': testEnum,
      'phase': phase,
      'type': type,
      'isBefore': isBefore,
      'notification': notification,
      'imageType': imageType,
    };
  }

  factory TestResult.fromMap(Map<String, dynamic> map) {
    return TestResult(
      maKetQuaTest: map['maKetQuaTest'] as int,
      backgroundColor: map['backgroundColor'] as String,
      imageUrl: map['imageUrl'] as String,
      titleText: map['titleText'] as String,
      subText: map['subText'] as String,
      textColor: map['textColor'] as String,
      progressColor: map['progressColor'] as String,
      testEnum: map['testEnum'] as int,
      phase: map['phase'] as int,
      type: map['type'] as int,
      isBefore: map['isBefore'] as int,
      notification: map['notification'] as String,
      imageType: map['imageType'] as int, titleNotification: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TestResult.fromJson(String source) =>
      TestResult.fromMap(json.decode(source) as Map<String, dynamic>);
}
