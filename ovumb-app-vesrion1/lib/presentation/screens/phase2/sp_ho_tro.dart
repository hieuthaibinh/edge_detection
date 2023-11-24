import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

import '../../../data/model_test.dart';

class SanPhamHoTro extends StatefulWidget {
  const SanPhamHoTro({super.key});

  @override
  State<SanPhamHoTro> createState() => _SanPhamHoTroState();
}

class _SanPhamHoTroState extends State<SanPhamHoTro> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        // endDrawer: GlobalDrawer(
        //   size: screenSize,
        //   scaffoldKey: scaffoldKey,
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Sản Phẩm Hỗ Trợ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 18,
              color: grey700,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: Column(
          children: [
            Container(
              width: sizeWidth,
              height: sizeHeight * 0.38,
              color: Colors.transparent,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(left: 20),
                    height: sizeHeight * 0.04,
                    width: sizeWidth,
                    //color: Colors.green,
                    child: Text(
                      dataMeVaBe1[0].title,
                      style: TextStyle(
                          color: Palette.text,
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: sizeHeight * 0.45,
                    width: sizeWidth,
                    //color: Colors.blue,
                    padding: EdgeInsets.only(top: sizeHeight * 0.01),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 24, top: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          width: sizeWidth * 0.385,
                          decoration: BoxDecoration(
                            //color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurStyle: BlurStyle.normal,
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                  color: dataMeVaBe1[index].color,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: sizeHeight * 0.18,
                                width: sizeWidth,
                                child: Image.asset(
                                  dataMeVaBe1[index].imageAsset,
                                  scale: 3,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurStyle: BlurStyle.normal,
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 14,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          color: Colors.white,
                                          width: sizeWidth * 0.28,
                                          height: sizeHeight * 0.04,
                                          child: Text(
                                            dataMeVaBe1[index].name,
                                            style: TextStyle(
                                              color: Palette.text,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, //////////////////////////////////////
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          width: sizeWidth * 0.28,
                                          height: sizeHeight * 0.04,
                                          child: Text(
                                            dataMeVaBe1[index].price,
                                            style: TextStyle(
                                              color: Palette.textColor,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: sizeHeight * 0.08,
                                      width: sizeWidth * 0.105,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          launchWebUrl(dataMeVaBe1[index].link);
                                        },
                                        icon: Image.asset(
                                          'assets/buttons/show.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizeWidth,
              height: sizeHeight * 0.38,
              color: Colors.transparent,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(left: 20),
                    height: sizeHeight * 0.04,
                    width: sizeWidth,
                    //color: Colors.green,
                    child: Text(
                      dataMeVaBe2[0].title,
                      style: TextStyle(
                          color: Palette.text,
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: sizeHeight * 0.45,
                    width: sizeWidth,
                    //color: Colors.blue,
                    padding: EdgeInsets.only(top: sizeHeight * 0.01),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 24, top: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          width: sizeWidth * 0.385,
                          decoration: BoxDecoration(
                            //color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurStyle: BlurStyle.normal,
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                  color: dataMeVaBe2[index].color,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: sizeHeight * 0.18,
                                width: sizeWidth,
                                child: Image.asset(
                                  dataMeVaBe2[index].imageAsset,
                                  scale: 3,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurStyle: BlurStyle.normal,
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 14,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          color: Colors.white,
                                          width: sizeWidth * 0.28,
                                          height: sizeHeight * 0.04,
                                          child: Text(
                                            dataMeVaBe2[index].name,
                                            style: TextStyle(
                                              color: Palette.text,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, //////////////////////////////////////
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          width: sizeWidth * 0.28,
                                          height: sizeHeight * 0.04,
                                          child: Text(
                                            dataMeVaBe2[index].price,
                                            style: TextStyle(
                                              color: Palette.textColor,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: sizeHeight * 0.08,
                                      width: sizeWidth * 0.105,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Image.asset(
                                            'assets/buttons/show.png'),
                                        onPressed: () {
                                          launchWebUrl(dataMeVaBe2[index].link);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
