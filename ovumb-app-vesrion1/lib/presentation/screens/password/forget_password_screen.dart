import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/validator/validator.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = 'forget-password-screen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // nhớ thêm with TickerProviderStateMixin vào phần đầu class
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
  }

  @override
  void dispose() {
    emailController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: rose300,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Image.asset('assets/buttons/back_1_button.png'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Container(
            width: sizeWidth * 0.65,
            //color: Colors.amber,
            alignment: Alignment.center,
            child: Text(
              'Quên mật khẩu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                rose300,
                rose600,
              ],
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            margin: EdgeInsets.fromLTRB(
                20, sizeHeight * 0.16, 20, sizeHeight * 0.26),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quên mật khẩu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Palette.title,
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Đừng lo lắng, hãy nhập lại địa chỉ email và OvumB sẽ gửi mật khẩu mới ngay cho bạn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Palette.text,
                            fontSize: 16,
                            fontFamily: 'Inter400',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          'Nhập email của bạn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xff667085),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Palette.title,
                              backgroundColor: Colors.transparent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Palette.title),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Palette.title),
                              ),
                            ),
                            cursorColor: rose400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
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
                        ],
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
                              screenSize.width * 0.8,
                              screenSize.height * 0.055,
                            ),
                          ),
                        ),
                        child: Text(
                          'Lấy lại mật khẩu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (emailController.text.isEmpty) {
                            showToast(context, 'Email không được bỏ trống');
                          } else if (!checkEmail(emailController.text)) {
                            showToast(context, 'Email không đúng định dạng');
                          } else {
                            context.read<AuthBloc>().add(
                                  AuthEventResetPassword(
                                      email: emailController.text),
                                );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
