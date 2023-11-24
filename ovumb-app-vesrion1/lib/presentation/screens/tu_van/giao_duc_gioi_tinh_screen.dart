// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_tuvan.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/canh_bao_cham_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';

class GiaoDucGioiTinhScreen extends StatelessWidget {
  static const routeName = 'giaoducgioitinh-screen';
  final String maNguoiDung;
  const GiaoDucGioiTinhScreen({
    Key? key,
    required this.maNguoiDung,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> listRouteName = [
      CanhBaoChamScreen.routeName,
      CanhBaoChamScreen.routeName,
      CanhBaoChamScreen.routeName,
      CanhBaoChamScreen.routeName,
    ];
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
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Image.asset(
              'assets/images/logo_app.png',
              scale: 7,
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
        body: Container(
          width: size.width,
          height: size.height,
          child: ListView.builder(
            itemCount: dataStartTuVanPhase5.length,
            itemBuilder: (context, index) {
              return Container(
                height: 170,
                width: size.width,
                margin: EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                  bottom: index == dataStartTuVanPhase5.length - 1 ? 30 : 0,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: dataStartTuVanPhase5[index]
                            .textColor
                            .withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(2, 4), // changes position of shadow
                      ),
                    ],
                    gradient: dataStartTuVanPhase5[index].backgroundColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 24, top: 10),
                      width: size.width,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              dataStartTuVanPhase5[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180),
                            child: Text(
                              dataStartTuVanPhase5[index].descrip,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1.4),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            height: size.height * 0.038,
                            width: size.width * 0.23,
                            margin: EdgeInsets.only(right: 60, bottom: 5),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                              ),
                              child: Text(
                                dataStartTuVanPhase5[index].textButton,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: dataStartTuVanPhase5[index].textColor,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  listRouteName[index],
                                  arguments: index,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          dataStartTuVanPhase5[index].imageAsset,
                          scale: 3.2,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
