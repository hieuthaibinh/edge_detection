import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/qrcode/qrcode.dart';
import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../widgets/title_text.dart';

// màn hình thông báo khi nhập mã code khi hết que test
class TestErrorScreen extends StatelessWidget {
  static const routeName = 'test-error-screen';
  const TestErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: TitleText(
              text: 'Test',
              fontWeight: FontWeight.w600,
              size: 18,
              color: rose400,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/right_home_icon.png'),
            ),
          ],
        ),
        body: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: size.width,
                    child: Image.asset(
                      'assets/images/error_background.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: TitleText(
                      text: 'Mã hết lượt dùng',
                      fontWeight: FontWeight.w700,
                      size: 24,
                      color: rose400,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Mã đã hết lượt sử dụng. Xin vui lòng thử lại!',
                      style: PrimaryFont.regular(16, FontWeight.w400).copyWith(
                        color: grey700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.1),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, QRCodeScreen.routeName),
                            style: ButtonStyle(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
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
                                  size.width,
                                  size.height * 0.065,
                                ),
                              ),
                              //foregroundColor: MaterialStateProperty.all(roseTitleText),
                              textStyle: MaterialStateProperty.all(
                                PrimaryFont.semibold(16, FontWeight.w600)
                                    .copyWith(color: greyText),
                              ),
                            ),
                            child: Text(
                              'Thử lại',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            String maNguoiDung =
                                await SharedPreferencesService.getId() ?? '';
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.routeName,
                              (route) => false,
                              arguments: {
                                'maNguoiDung': maNguoiDung,
                                'tbnkn': null,
                              },
                            );
                          },
                          child: Text(
                            'Hủy',
                            style: PrimaryFont.semibold(
                              16,
                              FontWeight.w400,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                              color: rose400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
