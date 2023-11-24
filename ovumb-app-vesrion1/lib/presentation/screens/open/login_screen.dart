// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';
import 'package:flutter_ovumb_app_version1/data/validator/validator.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/choose_home_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/password/forget_password_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/notification_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login-register-screen';
  String? taiKhoan;
  String? matKhau;
  LoginScreen({
    super.key,
    this.taiKhoan,
    this.matKhau,
    required int widgetId,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>
  List<TextEditingController> _listController = [
    TextEditingController(),
    TextEditingController(),
  ];

  bool isClick = false;

  @override
  void initState() {
    _listController[0].text = widget.taiKhoan ?? '';
    _listController[1].text = widget.matKhau ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _listController[0].dispose();
    _listController[1].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLoggedNotInfor) {
          if (state.ageEnum == AgeEnum.teenage) {
            Navigator.pushNamed(
              context,
              QuestionMainScreen.routeName,
              arguments: 5,
            );
          } else {
            Navigator.pushNamed(
              context,
              ChooseHomeScreen.routeName,
            );
          }
        } else if (state is AuthStateRegisterSuccess) {
          showNotificationDialog(
            context,
            'Đăng ký thành công',
            'Tài khoản của bạn đã sẵn sàng được sử dụng. Trang chủ sẽ được quay lại sau vài giây',
          );
          Future.delayed(
            Duration(seconds: 2),
            () {
              Navigator.pushReplacementNamed(
                context,
                LoginScreen.routeName,
                arguments: {
                  'taiKhoan': state.taiKhoan,
                  'matKhau': state.matKhau,
                },
              );
            },
          );
        } else if (state is AuthStateResetPaswordSuccess) {
          showNotificationDialog(
            context,
            'Mật khẩu đã được làm mới',
            'Mật khẩu mới đã được gửi vào email của bạn. Trang chủ sẽ được quay lại sau vài giây',
          );
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(
              context,
              LoginScreen.routeName,
              arguments: {
                'taiKhoan': '',
                'matKhau': '',
              },
            );
          });
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 130),
                        child: Image.asset(
                          'assets/images/logo_main.png',
                          scale: 1.5,
                        ),
                      ),
                      Column(
                        children: [
                          RegisterInput(
                            name: 'Số điện thoại',
                            iconUrl: 'assets/icons/phone_icon.png',
                            controller: _listController[0],
                            isClick: isClick,
                            isPassword: false,
                          ),
                          const SizedBox(height: 20),
                          RegisterInput(
                            name: 'Mật khẩu',
                            iconUrl: 'assets/icons/lockgrey.png',
                            controller: _listController[1],
                            isClick: isClick,
                            isPassword: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    shadowColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  child: Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff98a2b3),
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        ForgetPasswordScreen.routeName);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      //button
                      DecoratedBox(
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
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            fixedSize: MaterialStatePropertyAll(
                              Size(
                                screenSize.width * 0.9,
                                screenSize.height * 0.065,
                              ),
                            ),
                          ),
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            if (!checkEmpty(_listController)) {
                              showToast(context, 'Vui lòng nhập đủ thông tin');
                            } else {
                              context.read<AuthBloc>().add(
                                    AuthEventLogin(
                                      _listController[0].text,
                                      _listController[1].text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bạn chưa có tài khoản?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff98a2b3),
                              decoration: TextDecoration.none,
                              fontSize: 16,
                            ),
                          ),
                          //--2
                          //Textbutton đăng ký ngay
                          const SizedBox(width: 4),
                          InkWell(
                            child: Text(
                              'Đăng ký ngay',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Palette.title,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
