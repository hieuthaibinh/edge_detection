import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  final bool isCheck;
  static const routeName = 'update-screen';
  const OnboardingScreen({super.key, required this.isCheck});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              //color: Colors.amber,
              height: size.height * 0.62,
              width: size.width,
              child: Lottie.asset('assets/images/update.json'),
            ),
            SizedBox(
              //color: Colors.green,
              height: size.height * 0.19,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    //color: Colors.purple,
                    width: size.width,
                    height: size.height * 0.09,
                    child: const Text(
                      'Tính Năng Sắp Được Mở',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: rose500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //color: Colors.blue,
                    width: size.width,
                    height: size.height * 0.09,
                    child: const Text(
                      'Tính năng đang được phát triển.\nHãy đón chờ tại phiên bản sau!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: grey700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isCheck == true) ...[
              Container(
                width: size.width * 0.9,
                height: size.height * 0.06,
                //margin: EdgeInsets.fromLTRB(25, 30, 25, 80),
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  gradient: const LinearGradient(
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
                  ],
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: const Text(
                    'Quay lại',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {
                    final id = await SharedPreferencesService.getId();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      MainScreen.routeName,
                      (route) => false,
                      arguments: {
                        'maNguoiDung': id,
                        'tbnkn': null,
                      },
                    );
                  },
                ),
              ),
            ] else ...[
              Container(
                width: size.width * 0.9,
                height: size.height * 0.06,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
