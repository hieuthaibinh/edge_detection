import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/tuvan/datlich.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/tuvan/gioithieu.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/tuvan/lienhe.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/tuvan/phongkham.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/tuvan/thongtin.dart';

class Tuvan5Screen extends StatelessWidget {
  static const routeName = 'tuvan5-screen';
  TVV tvv;
  Tuvan5Screen({
    super.key,
    required this.tvv,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: TitleText(
              text: 'Đội Ngũ Chuyên Gia',
              fontWeight: FontWeight.w600,
              size: 18,
              color: rose500,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          leading: IconButton(
            color: const Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.transparent,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Thongtin(tvv: tvv),
              Gioithieu(tvv: tvv),
              Phongkham(),
              Lienhe(tvv: tvv),
              Datlich(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
