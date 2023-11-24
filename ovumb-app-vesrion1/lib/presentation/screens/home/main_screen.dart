// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/logic/upgrade/upgrade_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/warning_lh_dialog.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

import 'package:flutter_ovumb_app_version1/logic/ads/ads.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/onesignal/onesignal.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/calendar/calendar_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chart_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/profile/profile_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_initial_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../utils/color.dart';
import '../../widgets/home/home_tabbar.dart';
import 'home_screen.dart';

//màn hình main chính
class MainScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  final NguoiDung nguoiDung;
  final int? tbnkn;
  const MainScreen({
    Key? key,
    required this.nguoiDung,
    this.tbnkn,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentTab = 0;
  int index = -1;
  int countDown = 0;
  bool isShowAds = false;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    if (!isShowAds) {
      isShowAds = true;
      showAds(
        context: context,
        isToday: true,
        type: 0,
      );
    }

    if (widget.tbnkn != null) {
      if (widget.tbnkn! >= 45) {
        Future.delayed(Duration(seconds: 2), () {
          warningLHDialog(context);
        });
      }
    }

    UpgraderLogic().checkVersion(context: context, dayNextRequest: 2);

    onChangedTab(0);
    super.initState();
    setupOneSignal(1234);
  }

  Future<void> setupOneSignal(int userId) async {
    await initOneSignal();
    registerOneSignalEventListener(
      onOpened: onOpend,
      onReceivedForeground: onReceivedInForeground,
    );
    promptPolicyPrivacy(userId);
  }

  void onOpend(OSNotificationOpenedResult result) {
    //print('Notification handler call');
  }

  void onReceivedInForeground(OSNotificationReceivedEvent event) {
    //print('Notification received in foreground');
  }

  Future<void> promptPolicyPrivacy(int userId) async {
    final oneSignalShared = OneSignal.shared;
    bool userProviderPrivacyConsent =
        await oneSignalShared.userProvidedPrivacyConsent();

    if (userProviderPrivacyConsent) {
      sendUserTag(userId);
    } else {
      bool requiresConsent = await oneSignalShared.requiresUserPrivacyConsent();
      if (requiresConsent) {
        final accepted =
            await OneSignal.shared.promptUserForPushNotificationPermission();
        if (accepted) {
          await oneSignalShared.consentGranted(true);
          sendUserTag(userId);
        }
      } else {
        sendUserTag(userId);
      }
    }
  }

  //Widget currentScreen =  Home1(scaffoldKey: scaffoldKey,);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final List<Widget> screens = [
      HomeScreen(phase: widget.nguoiDung.phase!),
      ChartScreen(),
      CalendarScreen(scaffoldKey: scaffoldKey),
      ProfileScreen(scaffoldKey: scaffoldKey),
    ];
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: WillPopScope(
        onWillPop: () async {
          if (countDown == 1) {
            countDown = 0;
            SystemNavigator.pop();
          } else {
            showToast(context, 'Ấn lần nữa để THOÁT');
            countDown++;
          }
          Future.delayed(Duration(seconds: 2), () {
            countDown = 0;
          });
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: GlobalDrawer(
            size: screenSize,
            scaffoldKey: scaffoldKey,
          ),
          backgroundColor: whiteColor,
          body: ShowCaseWidget(
            enableAutoScroll: true,
            builder: Builder(
              builder: (context) => screens[index],
            ),
          ),
          floatingActionButton: Container(
            //color: Colors.amber,
            padding: EdgeInsets.zero,
            child: InkWell(
              onTap: () {
                if (widget.nguoiDung.phase == 5) {
                  showToast(
                      context, 'Tính năng không phù hợp với độ tuổi của bạn');
                } else {
                  Navigator.pushNamed(context, TestInitialScreen.routeName);
                }
                //showToast(context, 'Tính năng sắp ra mắt');
              },
              child: Image.asset(
                'assets/icons/scan_icon.png',
                scale: 3,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: HomeTabbar(
            index: index,
            phase: widget.nguoiDung.phase!,
            onChangedTab: onChangedTab,
          ),
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    if (this.index != index) {
      setState(() {
        this.index = index;
      });
      switch (index) {
        case 0:
          context
              .read<MainBloc>()
              .add(HomeEvent(id: widget.nguoiDung.maNguoiDung));
          break;
        case 1:
          context.read<MainBloc>().add(ChartEvent());
          break;
        case 2:
          context
              .read<MainBloc>()
              .add(CalendarEvent(id: widget.nguoiDung.maNguoiDung));
          break;
        case 3:
          context
              .read<MainBloc>()
              .add(ProfileEvent(id: widget.nguoiDung.maNguoiDung));
          break;
        default:
          break;
      }
    }
  }

  openTheDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
}
