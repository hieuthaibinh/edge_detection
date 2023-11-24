// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/ckkn.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/calendar/calendar_builder1_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/calendar/calendar_builder2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog_calendar.dart';
import '../../../logic/bloc/main/main_bloc.dart';
import '../../../logic/bloc/main/main_state.dart';
import '../../utils/color.dart';
import '../../widgets/title_text.dart';

// màn hình hiển thị lịch
class CalendarScreen extends StatefulWidget {
  static const routeName = 'calendar-screen';
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CalendarScreen({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late List<CKKN> listCKKN;
  late DateTime now;
  late int phase;
  late SynchronizedRepository _synchronizedRepository;
  final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();

  @override
  void initState() {
    _synchronizedRepository = SynchronizedRepository();

    super.initState();
    now = DateTime.now();
    _getPhase();
  }

  void _getPhase() async {
    String maNguoiDung = await SharedPreferencesService.getId() ?? '';
    final user = await LocalRepository().getNguoiDung(maNguoiDung);
    phase = user.phase!;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.center,
          child: Text(
            'Lịch',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: rose500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: TitleText(
            text: 'Ngày ${convertDateTime(DateTime.now())}',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
        ),
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/chu_thich_icon.png',
              scale: 3,
            ),
            onPressed: () {
              if (phase == 2) {
                dialogBuilder(context, screenSize);
              } else if (phase == 1) {
                dialogBuilder1(context, screenSize);
              } else {
                dialogBuilder2(context, screenSize);
              }
            },
            //onPressed: () => adsDialog(context, screenSize),
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/right_home_icon.png',
              scale: 3,
            ),
            onPressed: () => widget.scaffoldKey.currentState!.openEndDrawer(),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is CalendarState) {
            if (state.nguoiDung.phase == 2) {
              _kinhNguyetRepository.getCalendarDay(state.nguoiDung.maNguoiDung);
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: StreamBuilder<CalendarDay>(
                    stream: _kinhNguyetRepository.allListKN(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        DateTime firstDay = snapshot.data!.listKinh.first;
                        DateTime lastDay = snapshot.data!.listTrung.last;
                        final listRange = getMonthDateRange(firstDay, lastDay);
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
                              _synchronizedRepository.syncAll(
                                connected: connected,
                              );
                            }
                            return CalendarBuild1Screen(
                              nguoiDung: state.nguoiDung,
                              listCalendar: snapshot.data!,
                              listCauHoi: state.listCauHoi,
                              listRange: listRange,
                            );
                          },
                          child: const SizedBox(),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              );
            } else {
              _kinhNguyetRepository.getCalendarDay(state.nguoiDung.maNguoiDung);
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: StreamBuilder<CalendarDay>(
                    stream: _kinhNguyetRepository.allListKN(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        DateTime firstDay = snapshot.data!.listKinh.first;
                        DateTime lastDay = snapshot.data!.listTrung.last;
                        final listRange = getMonthDateRange(firstDay, lastDay);
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
                              _synchronizedRepository.syncAll(
                                connected: connected,
                              );
                            }
                            return CalendarBuild2Screen(
                              nguoiDung: state.nguoiDung,
                              listCalendar: snapshot.data!,
                              listCauHoi: state.listCauHoi,
                              listRange: listRange,
                            );
                          },
                          child: const SizedBox(),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
