// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/trieuchung/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/home3_drawer.dart';

class SucKhoe extends StatefulWidget {
  static const routeName = 'suc-khoe-screen';
  final Con con;
  final int index;
  final List<PhatTrienCon> phatTrienCon;
  final TrieuChung? trieuChung;
  const SucKhoe({
    Key? key,
    required this.con,
    required this.index,
    required this.phatTrienCon,
    this.trieuChung,
  }) : super(key: key);

  @override
  State<SucKhoe> createState() => _SucKhoeState();
}

class _SucKhoeState extends State<SucKhoe> with TickerProviderStateMixin {
  //phải có TickerProviderStateMixin, nếu ko thì cái this kia sẽ bị lỗi
  late TabController tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
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
                  'assets/images/bg_phase4_3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Scaffold(
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
                      'Sức Khỏe Bé Yêu',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: rose25,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  leading: IconButton(
                    icon: Image.asset(
                      'assets/buttons/back.png',
                      scale: 3,
                    ),
                    onPressed: () {
                      sound[0].player.stop();
                      sound[0].player.setVolume(0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home3(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          scaffoldKey.currentState!.openEndDrawer(),
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
                    child: Builder(builder: (BuildContext context) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 25,
                            ),
                            height: 55,
                            decoration: BoxDecoration(
                                color: grey100,
                                borderRadius: BorderRadius.circular(15)),
                            child: TabBar(
                              controller: tabController,
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.all(5.5),
                              unselectedLabelColor: grey400,
                              labelColor: grey700,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              tabs: [
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      dataChoAn[0].title1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      dataChoAn[1].title1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      dataChoAn[2].title1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              onTap: (value) {},
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: [
                                ChoAnScreen(con: widget.con),
                                PhatTrien(
                                  widgetId: 1,
                                  con: widget.con,
                                  phatTrienCon: widget.phatTrienCon,
                                ),
                                TrieuChungScreen(
                                  con: widget.con,
                                  trieuChung: widget.trieuChung,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
