import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// màn hình thông báo khi nhập mã code vẫn còn que test
class TestAddedScreen extends StatelessWidget {
  static const routeName = 'test-added-screen';
  const TestAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: TitleText(
              text: 'Test',
              fontWeight: FontWeight.w600,
              size: 18,
              color: rose400,
            ),
          ),
          automaticallyImplyLeading: false,
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
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.5,
                child: Image.asset(
                  'assets/images/correct_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: TitleText(
                  text: 'Bạn Đã Có Thêm',
                  fontWeight: FontWeight.w700,
                  size: 24,
                  color: rose400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '12 lượt ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: rose400,
                            ),
                          ),
                          TextSpan(
                            text: 'sử dụng que thử rụng trứng',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: grey700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '1 lượt ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: rose400,
                                fontFamily: 'Inter'),
                          ),
                          TextSpan(
                            text: 'sử dụng que thử thai',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: grey700,
                                fontFamily: 'Inter'),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<TestBloc>().add(TestCheckEvent());
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
                      'Xác nhận',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
