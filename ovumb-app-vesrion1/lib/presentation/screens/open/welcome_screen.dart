import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/login_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'welcome-screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          decoration: BoxDecoration(
            gradient: Palette.background,
            image: DecorationImage(
              alignment: Alignment.topLeft,
              fit: BoxFit.scaleDown,
              // colorFilter:
              //     ColorFilter.mode(Colors.white.withOpacity(0.17), BlendMode.dstOut),
              image: const AssetImage('assets/images/hoa.png'),
              opacity: 0.35,
            ),
          ),
          child: Column(
            children: [
              //--1
              //expanded Text, ko có gì giải thích nhiều, bên trong có 1 button Bắt đầu cần chú ý
              SizedBox(
                //margin: EdgeInsets.only(top: 70),
                //color: Colors.yellow,
                height: sizeHeight * 0.5,
                child: Image.asset(
                  'assets/icons/logo_icon.png',
                  scale: 3,
                ),
              ),

              //--2
              Container(
                alignment: Alignment.center,
                //color: Colors.blue,
                height: sizeHeight * 0.2,
                child: const Text(
                  'Chào mừng bạn\nđến với OvumB',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              //-3
              Container(
                alignment: Alignment.topCenter,
                //color: Colors.yellow,
                height: sizeHeight * 0.15,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Ứng dụng hỗ trợ chăm sóc sức khỏe sinh sản dành cho nữ giới hàng đầu Việt Nam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              //--4
              //button bắt đầu
              Container(
                height: sizeHeight * 0.065,
                width: sizeWidth * 0.9,
                margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(56),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                      arguments: {
                        'taiKhoan': '',
                        'matKhau': '',
                      },
                    );
                  },
                  child: const Text(
                    'Bắt đầu',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Palette.title,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              //--2
              //text Beta
            ],
          ),
        ),
      ),
    );
  }
}
