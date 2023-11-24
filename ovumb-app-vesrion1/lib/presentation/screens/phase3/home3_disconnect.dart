// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// màn hình chọn que test
class Home3DisconnectScreen extends StatefulWidget {
  static const routeName = 'home3-disconnect-screen';
  final VoidCallback callback;
  const Home3DisconnectScreen({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<Home3DisconnectScreen> createState() => _Home3DisconnectScreenState();
}

class _Home3DisconnectScreenState extends State<Home3DisconnectScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              height: 450,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: grey100,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 5),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset('assets/images/connect_error.png'),
                  const SizedBox(height: 10),
                  TitleText(
                    text: 'Không Có Kết Nối Internet',
                    fontWeight: FontWeight.w600,
                    size: 20,
                    color: rose500,
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          text: 'Hãy thử các bước sau để kết nối lại:',
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: greyText,
                        ),
                        const SizedBox(height: 4),
                        TitleText(
                          text: '\u2022 Kiểm tra modem và bộ định tuyến',
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: greyText,
                        ),
                        const SizedBox(height: 4),
                        TitleText(
                          text: '\u2022 Kết nối lại Wifi',
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: greyText,
                        ),
                      ],
                    ),
                  )
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
                        // onPressed: () =>
                        //     context.read<MilkBloc>().add(CheckBabyExistEvent()),
                        onPressed: widget.callback,
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
    );
  }
}
