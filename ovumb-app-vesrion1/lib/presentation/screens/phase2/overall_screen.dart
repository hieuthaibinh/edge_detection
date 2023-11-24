import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/upgrade/upgrade_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import '../../widgets/drawer/global_drawer.dart';
import 'body_overall_screen.dart';

class OverallScreen extends StatefulWidget {
  static const routeName = 'overall-screen';
  final int widgetId;
  final DateTime ngayDuSinh;
  const OverallScreen({
    super.key,
    required this.widgetId,
    required this.ngayDuSinh,
  });

  @override
  State<OverallScreen> createState() => _OverallScreenState();
}

class _OverallScreenState extends State<OverallScreen> {
  bool isCheckButton = false; // true => show button Chi tiet
  bool isShowDetail = false;
  SynchronizedRepository _synchronizedRepository = SynchronizedRepository();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    UpgraderLogic().checkVersion(context: context, dayNextRequest: 2);
    _synchronizedRepository.syncThaiKiToServer();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
          title: Center(
            child: Image.asset(
              'assets/images/logo_app.png',
              scale: 7,
            ),
          ),
          leading: const Text(''),
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
        body: BodyOverall(
          widgetId: 0,
          ngayDuSinh: widget.ngayDuSinh,
          clickId: 0,
        ),

        // Container(
        //   height: screenSize.height,
        //   width: screenSize.width,
        //   child: ListView(
        //     physics: BouncingScrollPhysics(),
        //     children: [
        //       // Container(
        //       //   height: screenSize.height,
        //       //   child:
        //       //   Stack(
        //       //     children: [
        //       //       CalendarPhase2(widgetId: 0,),
        //       //       BodyOverall(
        //       //         widgetId: 0,
        //       //         ngayDuSinh: widget.ngayDuSinh,
        //       //       )
        //       //     ],
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
