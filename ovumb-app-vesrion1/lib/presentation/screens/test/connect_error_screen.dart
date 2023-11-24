// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// màn hình chọn que test
class ConnectErrorScreen extends StatefulWidget {
  static const routeName = 'connect-error-screen';
  final VoidCallback voidCallback;
  const ConnectErrorScreen({
    Key? key,
    required this.voidCallback,
  }) : super(key: key);

  @override
  State<ConnectErrorScreen> createState() => _ConnectErrorScreenState();
}

class _ConnectErrorScreenState extends State<ConnectErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool test1Selected = false;
  bool test2Selected = false;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              Expanded(
                flex: 16,
                child: Image.asset('assets/images/connect_error.png'),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      text: 'Không Có Kết Nối Internet',
                      fontWeight: FontWeight.w600,
                      size: 26,
                      color: rose500,
                    ),
                    const SizedBox(height: 6),
                    TitleText(
                      text: 'Hãy thử các bước sau để kết nối lại:',
                      fontWeight: FontWeight.w400,
                      size: 16,
                      color: greyText,
                    ),
                    TitleText(
                      text: '\u2022 Kiểm tra modem và bộ định tuyến',
                      fontWeight: FontWeight.w400,
                      size: 16,
                      color: greyText,
                    ),
                    TitleText(
                      text: '\u2022 Kết nối lại Wifi',
                      fontWeight: FontWeight.w400,
                      size: 16,
                      color: greyText,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(color: Palette.title),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Text(
                            'Quay lại',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Palette.title,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          gradient: LinearGradient(
                            colors: [rose500, rose300],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () =>
                              context.read<TestBloc>().add(TestCheckEvent()),
                          child: Text(
                            'Thử lại',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
