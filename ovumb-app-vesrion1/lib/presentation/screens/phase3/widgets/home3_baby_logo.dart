// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class Home3BabyLogo extends StatelessWidget {
  final Con con;
  const Home3BabyLogo({
    Key? key,
    required this.con,
  }) : super(key: key);

  String _getText(Con con) {
    List<String> list = con.ten.trim().split(' ');
    return list.last[0].toUpperCase();
  }

  Color _checkGender(String gender) {
    return gender == 'Nam' ? Color(0xff7BA0FF) : Color(0xffFD6F8E);
  }

  bool _checkSelected(int isSelected) {
    return isSelected == 1 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        height: 65,
        width: 65,
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_checkSelected(con.trangThai!)) ...[
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  //color: Color(0xffFD6F8E),
                  border: Border.all(
                    color: _checkGender(con.gioiTinh),
                    width: 2,
                  ),
                ),
              ),
            ],
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: _checkGender(con.gioiTinh),
              ),
              child: Center(
                child: TitleText(
                  text: _getText(con),
                  fontWeight: FontWeight.w700,
                  size: 14,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
