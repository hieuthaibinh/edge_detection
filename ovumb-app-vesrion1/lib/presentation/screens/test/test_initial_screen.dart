import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/qrcode/qrcode.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/connect_error_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_added_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_error_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_manage_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_select_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/test_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../widgets/title_text.dart';

// màn hình nhập code test
class TestInitialScreen extends StatelessWidget {
  static const routeName = 'test-initial-screen';
  const TestInitialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<TestBloc>().add(TestCheckEvent());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: TitleText(
            text: 'Test',
            fontWeight: FontWeight.w600,
            size: 18,
            color: rose500,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          actions: [
            IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: BlocConsumer<TestBloc, TestState>(
          listener: (context, state) {
            if (state is TestStateQRSubmitSuccess) {
              Navigator.pushReplacementNamed(
                  context, TestAddedScreen.routeName);
            } else if (state is TestStateQRSubmitFailure) {
              Navigator.pushReplacementNamed(
                  context, TestErrorScreen.routeName);
            }
          },
          builder: (context, state) {
            if (state is TestStateLoading) {
              return getShimmer(TestShimmer());
            } else if (state is TestStateHasQueTest) {
              final int count = state.quanLyQueTest.soLuongQueThai +
                  state.quanLyQueTest.soLuongQueTrung;
              if (count > 0) {
                return TestSelectScreen(
                  quanLyQueTest: state.quanLyQueTest,
                  videos: state.videos,
                  images: state.images,
                );
              }
            } else if (state is TestStateFailure) {
              return ConnectErrorScreen(
                  voidCallback: () =>
                      context.read<TestBloc>().add(TestCheckEvent()));
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      height: screenSize.height * 0.725,
                      //color: Colors.amber,
                      child: Column(
                        children: [
                          Container(
                            height: screenSize.height * 0.57,
                            //color: Colors.green,
                            child: Image.asset('assets/images/qr1.png'),
                          ),
                          Container(
                            width: screenSize.width,
                            height: screenSize.height * 0.059,
                            //color: Colors.blue,
                            child: Text(
                              'Quét mã để Test',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: rose400,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width,
                            height: screenSize.height * 0.075,
                            // color: Colors.green,
                            child: Text(
                              'Với mỗi hộp OvumB, bạn sẽ được cung cấp 1 mã QR để test cho nhiều lần sử dụng',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: grey700,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Palette.textColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, QRCodeScreen.routeName),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/qr.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Quét mã QR',
                                  style: PrimaryFont.semibold(
                                    16,
                                    FontWeight.w500,
                                  ).copyWith(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, TestManageScreen.routeName);
                            context.read<TestBloc>().add(TestCheckEvent());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/shopping.png',
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Mua que OvumB',
                                style: PrimaryFont.semibold(
                                  16,
                                  FontWeight.w500,
                                ).copyWith(
                                  decoration: TextDecoration.none,
                                  color: rose400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
