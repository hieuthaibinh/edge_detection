// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/data/model_tuvan.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/canh_bao_cham_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';

class Tuvan1Screen extends StatelessWidget {
  final String maNguoiDung;
  final int phase;
  const Tuvan1Screen({
    Key? key,
    required int widgetId,
    required this.maNguoiDung,
    required this.phase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              decoration: BoxDecoration(
                  //color: Colors.red,
                  ), ////
              height: 380,
              width: size.width,
              child: DanhSachLuaChon(phase: phase),
            ),
            if (phase != 3) ...[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    //color: Colors.yellow,
                    ), ////
                height: 240,
                child: DanhSachSanPham(phase: phase),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DanhSachLuaChon extends StatelessWidget {
  final int phase;
  const DanhSachLuaChon({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 170,
          width: size.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: dataTuVan[phase - 1][0].textColor.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(2, 4), // changes position of shadow
                ),
              ],
              gradient: dataTuVan[phase - 1][0].backgroundColor,
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
                        dataTuVan[phase - 1][0].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Text(
                        dataTuVan[phase - 1][0].descrip,
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
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: Text(
                          dataTuVan[phase - 1][0].textButton,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: dataTuVan[phase - 1][0].textColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        onPressed: () {
                          if (phase != 3) {
                            context
                                .read<BlogBloc>()
                                .add(AllBlogEvent(phase: phase));
                            Navigator.pushNamed(context, BlogScreen.routeName,
                                arguments: phase);
                          } else {
                            Navigator.pushNamed(
                                context, CanhBaoChamScreen.routeName);
                          }
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
                    dataTuVan[phase - 1][0].imageAsset,
                    scale: 3.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          height: 170,
          width: size.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: dataTuVan[phase - 1][1].textColor.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(2, 4), // changes position of shadow
                ),
              ],
              gradient: dataTuVan[phase - 1][1].backgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 24),

                width: size.width,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: Text(
                        dataTuVan[phase - 1][1].title,
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
                        dataTuVan[phase - 1][1].descrip,
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
                      height: size.height * 0.035,
                      width: size.width * 0.23,
                      margin: EdgeInsets.only(right: 60, bottom: 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: Text(
                          dataTuVan[phase - 1][1].textButton,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: dataTuVan[phase - 1][1].textColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Tuvan2Screen.routeName,
                              arguments: phase);
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
                    dataTuVan[phase - 1][1].imageAsset,
                    scale: 3.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DanhSachSanPham extends StatelessWidget {
  final int phase;
  const DanhSachSanPham({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 230,
          width: size.width * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(dataStartTuVan2[0].imageAsset),
            ),
          ),
          child: ElevatedButton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    dataStartTuVan2[0].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    dataStartTuVan2[0].descrip,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () async {
              await LaunchUrl.web(
                context: context,
                maLink: maLinkEspharmaNu,
                tenLink: linkEspharmaNu,
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 230,
          width: size.width * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(dataStartTuVan2[1].imageAsset),
            ),
          ),
          child: ElevatedButton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    dataStartTuVan2[1].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    dataStartTuVan2[1].descrip,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () async {
              await LaunchUrl.web(
                context: context,
                maLink: maLinkEspharmaNam,
                tenLink: linkEspharmaNam,
              );
            },
          ),
        ),
      ],
    );
  }
}
