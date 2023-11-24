import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class TestResultThaiScreen extends StatelessWidget {
  final TestResult testResult;
  const TestResultThaiScreen({
    Key? key,
    required this.testResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse(testResult.backgroundColor)),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Image.asset(testResult.imageUrl),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      TitleText(
                        text: testResult.titleText,
                        fontWeight: FontWeight.w700,
                        size: 24,
                        color: Color(int.parse(testResult.textColor)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        testResult.subText[0],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ).copyWith(
                          color: grey600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainScreen.routeName,
                          arguments: {
                            'nguoiDung': nguoiDung,
                            'tbnkn': null,
                          },
                          (route) => false,
                        );
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
