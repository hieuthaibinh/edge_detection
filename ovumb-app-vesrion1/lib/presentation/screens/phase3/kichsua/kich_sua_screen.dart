// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3_disconnect.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/kichsua/kich_sua_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/choan_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/home3_drawer.dart';

class KichSuaScreen extends StatefulWidget {
  static const routeName = 'kich-sua-screen';
  final Con con;
  KichSuaScreen({
    Key? key,
    required this.con,
  }) : super(key: key);

  @override
  State<KichSuaScreen> createState() => _KichSuaScreenState();
}

class _KichSuaScreenState extends State<KichSuaScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _callBackBloc();
    super.initState();
  }

  void _callBackBloc() {
    context.read<ChoAnBloc>().add(KichSuaEvent());
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
                'assets/images/bg_phase4_3.png',
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
                    'Hành Trình Kích Sữa',
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
                    onPressed: () => Navigator.pop(context),
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
                margin: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                padding: EdgeInsets.only(
                  left: 5,
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                child: BlocBuilder<ChoAnBloc, ChoAnState>(
                  builder: (context, state) {
                    if (state is KichSuaState) {
                      return KichSuaWidget(
                        chartDataHistory: state.chartDataHistory,
                        chartDataByDay: state.chartDataByDay,
                        hutSua: state.hutSua,
                        con: widget.con,
                      );
                    } else if (state is LoadingFailureState) {
                      return Home3DisconnectScreen(callback: _callBackBloc);
                    }
                    return getShimmer(ChoAnShimmer());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
