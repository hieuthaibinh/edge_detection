// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/andam.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/bubinh.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/bume.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/home3_drawer.dart';

class NavScreen extends StatefulWidget {
  static const routeName = 'nav-screen';
  int widgetId;
  int clickId;
  int count;
  Con con;
  NavScreen({
    Key? key,
    required this.widgetId,
    required this.clickId,
    required this.count,
    required this.con,
  }) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: dataChoAn[widget.widgetId].id,
  );
  Color color = Colors.transparent;

  @override
  void initState() {
    color = dataChoAn[widget.widgetId].color;
    tabController.addListener(() {
      if (tabController.index == 0) {
        color = dataChoAn[0].color;
      }
      if (tabController.index == 1) {
        color = dataChoAn[1].color;
      }
      if (tabController.index == 2) {
        color = dataChoAn[3].color;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffafafa),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.2,
              width: size.width,
              child: Image.asset(
                'assets/images/bg_phase4_2.png',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              key: scaffoldKey,
              endDrawer: Home3Drawer(
                size: size,
                scaffoldKey: scaffoldKey,
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Nhập Dữ Liệu',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: rose25,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                leading: Container(
                  color: Colors.transparent,
                  // alignment: Alignment.centerLeft,
                  // padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton.icon(
                    style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
                    icon: const SizedBox(
                      height: 20,
                      width: 20,
                      child: ImageIcon(
                        AssetImage('assets/buttons/back.png'),
                        color: rose25,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                      context.read<ChoAnBloc>().add(ChoanInitialEvent());
                    },
                    label: const Text(''),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                    icon: Image.asset(
                      'assets/buttons/menu.png',
                      scale: 3,
                      color: rose25,
                    ),
                  ),
                ],
              ),
              body: Container(
                alignment: Alignment.center,
                width: size.width,
                margin: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                padding: EdgeInsets.only(
                  left: 5,
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      //button
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 25,
                          ),
                          height: 55,
                          decoration: BoxDecoration(
                              color: grey100,
                              borderRadius: BorderRadius.circular(15)),
                          child: TabBar(
                            //controller để hiện ra là đang chọn button nào
                            controller: tabController,
                            //onTap: pageSelected(),
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.all(5.5),
                            unselectedLabelColor: grey400,
                            labelColor: Colors.white,
                            indicatorColor: color,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // giá trị của màu nền button được lấy từ giá trị id lấy bên màn hình sức khỏe
                              color: color, //dataChoAn[widget.widgetId].color
                            ),
                            // còn 1 giá trị nữa là màu nền button, cơ mà là khi mk tự pick
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    dataChoAn[0].title2,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    dataChoAn[1].title2,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    dataChoAn[3].title2,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            onTap: (value) {
                              sound[0].isPlaying = true;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          //controller để hiện ra widget nào tương tứng vs button nào
                          controller: tabController,
                          children: [
                            BuMe(
                              count: widget.count,
                              type: ChoAnEnum.bume,
                              con: widget.con,
                            ),
                            BuBinh(
                              isShow: true,
                              widgetId:
                                  [0, 1, 3].contains(widget.clickId) ? 1 : 2,
                              con: widget.con,
                              count: widget.count,
                            ),
                            AnDam(
                              widgetId: 3,
                              con: widget.con,
                              count: widget.count,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
