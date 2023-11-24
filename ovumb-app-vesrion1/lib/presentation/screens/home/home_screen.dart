// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_state.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/home_phase1_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/home_phase2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/home_teenage_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/home_shimmer.dart';
import '../../utils/color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  final int phase;
  const HomeScreen({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
  late int phase;
  @override
  void initState() {
    super.initState();
    _getPhase();
  }

  void _getPhase() async {
    String maNguoiDung = await SharedPreferencesService.getId() ?? '';
    final user = await LocalRepository().getNguoiDung(maNguoiDung);
    phase = user.phase!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Image.asset(
          widget.phase == 5
              ? 'assets/logo/logo_app_vtn.png'
              : 'assets/logo/logo_app.png',
          scale: 3,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        leading: const Text(''),
        actions: [
          // InkWell(
          //   onTap: () =>
          //       Navigator.pushNamed(context, MainStoreScreen.routeName),
          //   child: StoreCartIcon(),
          // ),
          IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: Image.asset(
              'assets/icons/right_home_icon.png',
              scale: 3,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is HomeState) {
            _kinhNguyetRepository.getCalendarDay(state.nguoiDung.maNguoiDung);
            if (state.phase == 1) {
              return HomePhase1Screen(
                nguoiDung: state.nguoiDung,
                listCauHoi: state.listCauHoi,
                age: getAge(state.nguoiDung.namSinh),
              );
            } else if (state.phase == 2) {
              return HomePhase2Screen(
                nguoiDung: state.nguoiDung,
                listCauHoi: state.listCauHoi,
              );
            } else if (state.phase == 5) {
              return HomeTeenageScreen(
                nguoiDung: state.nguoiDung,
                listCauHoi: state.listCauHoi,
                age: getAge(state.nguoiDung.namSinh),
              );
            }
          }
          return getShimmer(HomeShimmer());
        },
      ),
    );
  }
}

class Check {
  int id;
  Check(this.id);
}

List<Check> check = [
  Check(0),
  Check(1), // check [].id
];
