// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_tuvan.dart';

import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/widgets/canh_bao_cham_dropdown.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/phase5_constant.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class CanhBaoChamScreen extends StatefulWidget {
  static const String routeName = 'canh-bao-cham-screen';
  final int currentIndex;
  const CanhBaoChamScreen({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CanhBaoChamScreen> createState() => _CanhBaoChamScreenState();
}

class _CanhBaoChamScreenState extends State<CanhBaoChamScreen> {
  bool isShow = false;
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
        appBar: AppBar(
          title: TitleText(
            text: dataStartTuVanPhase5[widget.currentIndex].title,
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          centerTitle: true,
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Image.asset(
                'assets/icons/back_button.png',
                scale: 3,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listTitleGDGT[widget.currentIndex].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              listCheckGDGT[widget.currentIndex][index] =
                                  !listCheckGDGT[widget.currentIndex][index];
                            });
                          },
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          child: CanhBaoChamDropdown(
                            image: listImageGDGT[widget.currentIndex][index],
                            title: listTitleGDGT[widget.currentIndex][index],
                            subTitle: listContentGDGT[widget.currentIndex]
                                [index],
                            isShow: listCheckGDGT[widget.currentIndex][index],
                            currentIndex: widget.currentIndex,
                          ),
                        );
                      },
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
