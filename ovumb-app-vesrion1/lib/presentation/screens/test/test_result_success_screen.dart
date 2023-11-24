// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/ketquatest/ketquatest_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/local/data_notification.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/edit_test_result.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/notification_setting.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class TestResultSuccessScreen extends StatefulWidget {
  final TestResult testResult;
  final int maKetQuaTest;
  final int lh;
  final int tbnkn;
  final int position;
  const TestResultSuccessScreen({
    Key? key,
    required this.testResult,
    required this.maKetQuaTest,
    required this.lh,
    required this.tbnkn,
    required this.position,
  }) : super(key: key);

  @override
  State<TestResultSuccessScreen> createState() =>
      _TestResultSuccessScreenState();
}

class _TestResultSuccessScreenState extends State<TestResultSuccessScreen> {
  ServerRepository _serverRepository = ServerRepository();
  KetQuaTestRepository _ketQuaTestRepository = KetQuaTestRepository();
  bool isCheckSetting = false;
  double _value = 0;
  int index = 0;
  bool _isDrag = false;
  bool _isEditLH = true;
  bool isShowEditBtn = true;

  @override
  void initState() {
    _value = initValue(widget.lh);
    index = checkRange(_value);
    checkShowEditBtn();
    super.initState();
  }

  double initValue(int lh) {
    return widget.lh.toDouble();
  }

  int lastValue(double value) {
    return value.toInt();
  }

  void checkShowEditBtn() {
    if (widget.lh > 70) {
      isShowEditBtn = false;
    }
  }

  // final listText = ['Thấp', 'Cao', 'Đạt đỉnh'];
  int checkRange(double value) {
    if (value < 6) {
      return 0;
    } else if (value < 17) {
      return 1;
    } else if (value < 29) {
      return 2;
    } else if (value < 40) {
      return 3;
    } else if (value < 52) {
      return 4;
    } else if (value < 63) {
      return 5;
    } else if (value < 74) {
      return 6;
    } else if (value <= 80) {
      return 7;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse(widget.testResult.backgroundColor)),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                flex: 5,
                child: widget.testResult.imageType == 1
                    ? Lottie.network(widget.testResult.imageUrl)
                    : CachedNetworkImage(
                        imageUrl: widget.testResult.imageUrl,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
              ),
              const SizedBox(height: 30),
              Expanded(
                flex: 1,
                child: TitleText(
                  text: widget.testResult.titleText,
                  fontWeight: FontWeight.w700,
                  size: 30,
                  color: Color(int.parse(widget.testResult.textColor)),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            color: Colors.transparent,
                            child: FlutterSlider(
                              disabled: _isEditLH,
                              values: [_value],
                              rangeSlider: false,
                              foregroundDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              max: 80,
                              min: 0,
                              selectByTap: false,
                              jump: false,
                              trackBar: FlutterSliderTrackBar(
                                activeTrackBarHeight: 6,
                                inactiveTrackBarHeight: 6,
                                activeDisabledTrackBarColor: Colors.transparent,
                                inactiveDisabledTrackBarColor:
                                    Colors.transparent,
                                inactiveTrackBar: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors
                                      .transparent, // Màu nền khi không được chọn
                                ),
                                activeTrackBar: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors
                                      .transparent, // Màu nền khi được chọn
                                ),
                              ),
                              tooltip: FlutterSliderTooltip(
                                disabled: true,
                              ),
                              handlerHeight: 45,
                              handlerWidth: 45,
                              handler: FlutterSliderHandler(
                                decoration: BoxDecoration(),
                                child: Material(
                                  color: Colors.transparent,
                                  type: MaterialType.canvas,
                                  //elevation: 3,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 8,
                                        child: Container(
                                          color: lineColor[index],
                                          height: 20,
                                          width: 30,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/keo.png',
                                        scale: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
                                setState(() {
                                  if (lowerValue >= 70) {
                                    isShowEditBtn = false;
                                  } else {
                                    isShowEditBtn = true;
                                  }
                                  _isDrag = true;
                                  _value = lowerValue;
                                  index = checkRange(lowerValue);
                                });
                              },
                            ),
                          ),
                          if (isShowEditBtn)
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: InkWell(
                                onTap: () async {
                                  bool? check =
                                      await editTestResult(context, screenSize);
                                  if (check == true) {
                                    setState(() {
                                      _isEditLH = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  //color: Colors.amber,
                                  child: Image.asset(
                                    'assets/icons/pencil.png',
                                    scale: 3,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Image.asset('assets/images/line_lh.png', scale: 2),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.testResult.subText,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ).copyWith(
                          color: grey600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 10),
                      // Text(
                      //   '*Trong trường hợp nghi ngờ kết quả kiểm tra hoặc đã được chuyên gia tư vấn, bạn cũng có thể kéo để sửa đổi',
                      //   textScaleFactor: 0.8,
                      //   style: const TextStyle(
                      //     fontFamily: 'Inter',
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w400,
                      //     height: 1.4,
                      //   ).copyWith(
                      //     color: grey500,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ),

              // const Expanded(
              //   flex: 1,
              //   child: SizedBox(),
              // ),
              const SizedBox(height: 30),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            rose600,
                            rose400,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(38),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: ElevatedButton(
                      onPressed: () async {
                        String maNguoiDung =
                            await SharedPreferencesService.getId() ?? '';
                        NguoiDung nguoiDung =
                            await LocalRepository().getNguoiDung(maNguoiDung);
                        if (widget.testResult.notification != '*') {
                          if (isCheckSetting) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.routeName,
                              arguments: {
                                'nguoiDung': nguoiDung,
                                'tbnkn': null,
                              },
                              (route) => false,
                            );
                            if (_isDrag) {
                              _serverRepository.updateKetQuaTest(
                                maKetQuaTest: widget.maKetQuaTest,
                                ketQua: lastValue(_value),
                              );
                              _ketQuaTestRepository.insertKetQuaTest(
                                ketQuaTest: KetQuaTest(
                                  maKetQuaTest: 1,
                                  maLoaiQue: 1,
                                  lanTest: 1,
                                  thoiGian: DateTime.now(),
                                  ketQua: lastValue(_value),
                                ),
                              );
                            }
                          } else {
                            checkLHNotification(
                              flutterLocalNotificationsPlugin,
                              widget.testResult.titleNotification,
                              widget.testResult.notification,
                            );
                            await requestNotificationPermission(
                                context, screenSize);
                            isCheckSetting = true;
                          }
                        } else {
                          flutterLocalNotificationsPlugin.cancel(1);
                          flutterLocalNotificationsPlugin.cancel(2);
                          flutterLocalNotificationsPlugin.cancel(3);

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            MainScreen.routeName,
                            arguments: {
                              'nguoiDung': nguoiDung,
                              'tbnkn': widget.tbnkn,
                            },
                            (route) => false,
                          );
                          if (_isDrag) {
                            _serverRepository.updateKetQuaTest(
                              maKetQuaTest: widget.maKetQuaTest,
                              ketQua: lastValue(_value),
                            );
                            _ketQuaTestRepository.insertKetQuaTest(
                              ketQuaTest: KetQuaTest(
                                maKetQuaTest: 1,
                                maLoaiQue: 1,
                                lanTest: 1,
                                thoiGian: DateTime.now(),
                                ketQua: lastValue(_value),
                              ),
                            );
                          }
                        }
                      },
                      style: ButtonStyle(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            screenSize.width,
                            screenSize.height * 0.065,
                          ),
                        ),
                        //foregroundColor: MaterialStateProperty.all(roseTitleText),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.semibold(16, FontWeight.w600)
                              .copyWith(color: greyText),
                        ),
                      ),
                      child: Text(
                        'Hoàn thành',
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
