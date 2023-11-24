// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/widgets/home_phase1_widgets.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/widgets/home_showcase.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/giao_duc_gioi_tinh_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_ovumb_app_version1/data/constant/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/ckkn_display.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhat_ky_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_calendar_phase2.dart';

class HomeTeenageScreen extends StatefulWidget {
  final NguoiDung nguoiDung;
  final List<CauHoi> listCauHoi;
  final int age;
  const HomeTeenageScreen({
    Key? key,
    required this.nguoiDung,
    required this.listCauHoi,
    required this.age,
  }) : super(key: key);

  @override
  State<HomeTeenageScreen> createState() => _HomeTeenageScreenState();
}

class _HomeTeenageScreenState extends State<HomeTeenageScreen> {
  final SynchronizedRepository _synchronizedRepository =
      SynchronizedRepository();
  final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  bool _showCaseView = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500));
      ShowCaseWidget.of(context)
          .startShowCase([_one, _two, _three, _four, _five]);
    });
    _checkShowCaseView();
    super.initState();
  }

  //kiểm tra xem app đã hiện hướng dấn bao giờ chưa, nếu chưa thì hiện, nếu hiện rồi thì không hiện nữa : ok ban
  void _checkShowCaseView() async {
    bool showCaseView =
        await SharedPreferencesService.getShowCaseView() ?? true;
    setState(() {
      _showCaseView = showCaseView;
    });
    Future.delayed(Duration(seconds: 10), () async {
      await SharedPreferencesService.setShowCaseView(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _showCaseView
                        ? InkWell(
                            onTap: () async {
                              await LaunchUrl.web(
                                context: context,
                                tenLink: linkLinkBiQuyetDa,
                                maLink: maLinkBiQuyetDa,
                              );
                            },
                            child: HomeShowcase(
                              currentKey: _one,
                              nextKey: _two,
                              text: SHOW_CASE3[0],
                              container: containerBiQuyet,
                              heightShowCase: 80,
                              widthShowCase: 120,
                              heightContainer: 60,
                              widthContainer: 170,
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              await LaunchUrl.web(
                                context: context,
                                tenLink: linkLinkBiQuyetDa,
                                maLink: maLinkBiQuyetDa,
                              );
                            },
                            child: containerBiQuyet,
                          ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      child: HomeShowcase(
                        currentKey: _two,
                        nextKey: _three,
                        text: SHOW_CASE3[1],
                        container: containerGDGT,
                        heightShowCase: 80,
                        widthShowCase: 205,
                        heightContainer: 60,
                        widthContainer: 170,
                      ),
                      onTap: () async {
                        Navigator.pushNamed(
                          context,
                          GiaoDucGioiTinhScreen.routeName,
                          arguments: widget.nguoiDung.maNguoiDung,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ///ontap screen nhat ky
            InkWell(
              child: HomeShowcase(
                currentKey: _three,
                nextKey: _four,
                text: SHOW_CASE3[2],
                container: containerNhatKy,
                heightShowCase: 80,
                widthShowCase: 300,
                heightContainer: 60,
                widthContainer: 170,
              ),
              onTap: () async {
                DateTime selecteDay = DateTime.parse(
                    DateFormat('yyyy-MM-dd 00:00:00.000')
                        .format(DateTime.now()));
                final listCauTraLoi = await LocalRepository().getListCauTraLoi(
                  id: widget.nguoiDung.maNguoiDung,
                  date: selecteDay.millisecondsSinceEpoch,
                );
                CalendarDay listCalendar = await _kinhNguyetRepository
                    .getCalendarDay(widget.nguoiDung.maNguoiDung);
                Navigator.pushNamed(
                  context,
                  NhatkyScreen.routeName,
                  arguments: {
                    'listCauHoi': widget.listCauHoi,
                    'nguoiDung': widget.nguoiDung,
                    'date': selecteDay,
                    'listCauTraLoi': listCauTraLoi,
                    'listCalendar': listCalendar,
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Showcase.withWidget(
                targetBorderRadius: BorderRadius.circular(14),
                disableMovingAnimation: true,
                key: _four,
                height: 80,
                width: 300,
                container: Container(
                  width: 200,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    //color: Colors.yellow,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/union.png',
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 170,
                        child: Text(
                          SHOW_CASE3[3],
                          textScaleFactor: 0.9,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            child: TextButton(
                              child: const Text(
                                'Bỏ qua',
                                textScaleFactor: 0.9,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  ShowCaseWidget.of(context).dismiss();
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 30,
                            margin: const EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  ShowCaseWidget.of(context)
                                      .startShowCase([_five]);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: StreamBuilder<CalendarDay>(
                    stream: _kinhNguyetRepository.allListKN(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        CKKNDisplay ckknDisplay = getCKKNDisplay(
                          snapshot.data!.currentKinhNguyet,
                          snapshot.data!.futureKinhNguyet,
                          5,
                        );

                        return OfflineBuilder(
                          connectivityBuilder: (
                            BuildContext context,
                            ConnectivityResult connectivity,
                            Widget child,
                          ) {
                            final bool connected =
                                connectivity != ConnectivityResult.none;
                            //khi có mạng kiểm tra đồng bộ dữ liệu
                            if (connected) {
                              _synchronizedRepository.syncTrangThai();
                              _synchronizedRepository.syncAll(
                                connected: connected,
                              );
                            }
                            return HomeCalendarPhase2(
                              listCalendar: snapshot.data!,
                              ckknDisplay: ckknDisplay,
                              listCauHoi: widget.listCauHoi,
                              nguoiDung: widget.nguoiDung,
                            );
                          },
                          child: const SizedBox(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              child: HomeShowcase(
                currentKey: _five,
                text: SHOW_CASE3[4],
                container: containerMeoHayTuoiDayThi,
                heightShowCase: 80,
                widthShowCase: 300,
                heightContainer: 60,
                widthContainer: 170,
              ),
              onTap: () {
                context.read<BlogBloc>().add(Phase5BlogEvent(phase: 3));
                Navigator.pushNamed(context, BlogScreen.routeName,
                    arguments: 3);
              },
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
