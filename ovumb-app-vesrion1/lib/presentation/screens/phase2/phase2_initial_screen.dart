// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/ngaydusinh_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

// màn hình chọn que test
class Phase2InitialScreen extends StatefulWidget {
  static const routeName = 'phase2-initial-screen';
  final int? phase;
  const Phase2InitialScreen({
    Key? key,
    this.phase,
  }) : super(key: key);

  @override
  State<Phase2InitialScreen> createState() => _Phase2InitialScreenState();
}

class _Phase2InitialScreenState extends State<Phase2InitialScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    flex: 16,
                    child: Image.asset('assets/images/mom.png'),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Xin chúc mừng!',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: rose500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Chào mừng con tới với cuộc đời này',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: greyText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'OvumB sẽ đồng hành trong 9 tháng thai kì cùng sinh linh bé bỏng của bạn, cung cấp các kiến thức hữu ích cho sức khỏe của bạn',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.phase == null) ...[
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                border: Border.all(color: Palette.title),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
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
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                              ),
                              onPressed: () async {
                                String maNguoiDung =
                                    await SharedPreferencesService.getId() ??
                                        '';
                                Navigator.pushNamed(
                                  context,
                                  NgayDuSinhScreen.routeName,
                                  arguments: {
                                    'maNguoiDung': maNguoiDung,
                                    'phase': widget.phase ?? 2,
                                  },
                                );
                              },
                              child: Text(
                                'Tiếp theo',
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
        ),
      ),
    );
  }
}
