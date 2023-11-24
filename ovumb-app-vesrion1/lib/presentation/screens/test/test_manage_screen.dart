import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/model_test.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/qrcode/qrcode.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_added_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_error_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_que_webview.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/test_manage_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/test/test_circular_percent.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class TestManageScreen extends StatefulWidget {
  static const routeName = 'test-manage-screen';
  const TestManageScreen({
    super.key,
  });

  @override
  State<TestManageScreen> createState() => _TestState();
}

class _TestState extends State<TestManageScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ServerRepository _serverRepository = ServerRepository();
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.center,
            child: TitleText(
              text: 'Quản Lý Que Test',
              fontWeight: FontWeight.w600,
              size: 18,
              color: rose500,
            ),
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
          elevation: 0,
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
            if (state is TestStateHasQueTest) {
              return ListView(
                children: [
                  Container(
                    height: 700,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            width: screenSize.width,
                            height: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  rose500,
                                  rose300,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //bo que test cac thu
                                children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    'Bổ sung lượt test',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Quét mã trên hộp để thêm lượt Test\nBổ sung thêm que nếu que của bạn đã hết nhé!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    //margin: EdgeInsets.only(left: 15, right: 15),
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ElevatedButton(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/qr_code.png',
                                            scale: 3,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Quét mã QR',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: rose500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                      ),
                                      onPressed: () => Navigator.pushNamed(
                                          context, QRCodeScreen.routeName),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 230,
                          left: 20,
                          right: 20,
                          child: Container(
                            width: screenSize.width,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  //spreadRadius: 1,
                                  offset: Offset(2, 3),
                                  color: Colors.grey.withOpacity(0.25),
                                  blurRadius: 9.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Số lần Test của bạn',
                                        style: TextStyle(
                                          color: Palette.text,
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TestCircularPercent(
                                                conlai: state.quanLyQueTest
                                                    .soLuongQueTrung,
                                                tong: state
                                                    .quanLyQueTest.tongQueTrung,
                                                index: 0,
                                              ),
                                              const SizedBox(width: 10),
                                              TestCircularPercent(
                                                conlai: state.quanLyQueTest
                                                    .soLuongQueThai,
                                                tong: state
                                                    .quanLyQueTest.tongQueThai,
                                                index: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  //ô tròn màu
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                      //color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xff6941c6),
                                                          Color(0xffb692f6)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  //cột text chi tiết
                                                  const SizedBox(width: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        dataTestNote[0].title,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        dataTestNote[0]
                                                            .describe,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  //ô tròn màu
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        gradient:
                                                            dataTestPercent[1]
                                                                .progressColor),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  //cột text chi tiết
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        dataTestNote[1].title,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        dataTestNote[1]
                                                            .describe,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
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
                        Positioned(
                          top: 270,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 150),
                                padding: EdgeInsets.only(left: 20),
                                height: screenSize.height * 0.04,
                                width: screenSize.width,
                                //color: Colors.green,
                                child: Text(
                                  'Mua thêm Que',
                                  style: TextStyle(
                                      color: Palette.text,
                                      fontSize: 19,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: 210,
                                width: screenSize.width,
                                //color: Colors.blue,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(left: 20),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dataTest.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        String? link =
                                            await _serverRepository.getLink(
                                                maLink: listMaLinkStore[index]);
                                        if (link == null) {
                                          Navigator.pushNamed(
                                              context, TestQueWebView.routeName,
                                              arguments: listLinkStore[index]);
                                        } else {
                                          Navigator.pushNamed(
                                              context, TestQueWebView.routeName,
                                              arguments: link);
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 16),
                                        width: 150,
                                        decoration: BoxDecoration(
                                          //color: Color(0xffffe4e8),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffffe4e8),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                              ),
                                              height: 150,
                                              width: screenSize.width,
                                              child: Image.asset(
                                                dataTest[index].imageAsset,
                                                scale: 3,
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 6,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      //spreadRadius: 1,
                                                      offset: Offset(2, 3),
                                                      color: Colors.grey
                                                          .withOpacity(0.15),
                                                      blurRadius: 7.0,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        dataTest[index].name,
                                                        style: TextStyle(
                                                          color: Palette.text,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        dataTest[index].price,
                                                        style: TextStyle(
                                                          color:
                                                              Palette.textColor,
                                                          fontSize: 14,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Palette.textColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/arrow.png',
                                                      scale: 3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                ],
              );
            }
            return getShimmer(TestManageShimmer());
          },
        ),
      ),
    );
  }
}
