import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/auth/auth_repository.dart';
import 'package:flutter_ovumb_app_version1/data/validator/register_validator.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/notification_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = 'change-password-screen';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  List<TextEditingController> _listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  bool isClick = false;
  late AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///khai báo width height tổng quát
    double sizeHeight = MediaQuery.of(context).size.height;
    Size screenSize = MediaQuery.of(context).size;
    //code chứa trong Scaffold gồm 2 phần chính: appBar và body
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                violet600,
                violet600,
              ],
            ),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(right: 50),
          //color: Colors.yellow,
          alignment: Alignment.center,
          child: Text(
            'Đổi Mật Khẩu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: Container(
          decoration: BoxDecoration(
              //color: Colors.blue,
              ),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Image.asset('assets/buttons/back_1_button.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                violet600,
                violet800,
              ],
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            margin: EdgeInsets.fromLTRB(
                24, sizeHeight * 0.12, 24, sizeHeight * 0.16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: const SizedBox(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Đổi mật khẩu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: violet500,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegisterInput(
                          name: 'Mật khẩu hiện tại',
                          iconUrl: 'assets/icons/lockgrey.png',
                          controller: _listController[0],
                          isClick: isClick,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        RegisterInput(
                          name: 'Mật khẩu mới',
                          iconUrl: 'assets/icons/lockgrey.png',
                          controller: _listController[1],
                          isClick: isClick,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        RegisterInput(
                          name: 'Xác nhận mật khẩu',
                          iconUrl: 'assets/icons/lockgrey.png',
                          controller: _listController[2],
                          isClick: isClick,
                          isPassword: true,
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
                            violet600,
                            violet400,
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
                          'Đổi mật khẩu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () async {
                          String? validate =
                              changePasswordValidator(_listController);
                          // validate == null là đã validate thành công
                          if (validate == null) {
                            // LoadingScreen().show(context: context, text: '');
                            LoadingLogo().show(context: context);
                            final check = await _authRepository.changePassword(
                              matKhau: _listController[0].text,
                              matKhauMoi: _listController[1].text,
                              password_confirmation: _listController[2].text,
                            );
                            // String maNguoiDung =
                            //     await SharedPreferencesService.getId() ?? '';
                            //final nguoiDung = await LocalRepository().getNguoiDung(maNguoiDung);
                            LoadingLogo().hide();
                            if (check) {
                              showNotificationDialog(
                                context,
                                'Đổi mật khẩu thành công',
                                'Mật khẩu đã được đổi thành công. Trang chủ sẽ được quay lại sau vài giây',
                              );
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            } else {
                              showErrorDialog(context,
                                  'Đổi mật khẩu không thành công. Vui lòng kiểm tra lại');
                            }
                          } else {
                            showToast(context, validate);
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
