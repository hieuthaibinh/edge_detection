// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/link/link_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_state.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan_history.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/milk.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/choan_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class BuMe extends StatefulWidget {
  final Con con;
  final int count;
  final ChoAnEnum type;
  const BuMe({
    Key? key,
    required this.con,
    required this.count,
    required this.type,
  }) : super(key: key);

  @override
  State<BuMe> createState() => _BuMeState();
}

class _BuMeState extends State<BuMe> with TickerProviderStateMixin {
  List<int> a = [];
  late AnimationController animationController;
  late Animation<double> animation;
  final LinkRepository _linkRepository = LinkRepository();
  int time = 0;
  int second = int.parse(dataBuMe[0].second) + int.parse(dataBuMe[1].second);
  int minus = int.parse(dataBuMe[0].minus) + int.parse(dataBuMe[1].minus);
  Duration duration = Duration(minutes: 0);
  MilkRepository _milkRepository = MilkRepository();
  TextEditingController _stopMilkController = TextEditingController();
  Guide? guide;
  final player = AudioPlayer();
  bool isPlay = true;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    _initLink();
    super.initState();
  }

  Future<void> _initLink() async {
    guide = await _linkRepository.getGuideBuMe();
    if (guide != null) {
      await player.play(UrlSource(guide!.link_video));
      player.setVolume(1);
    }
  }

  void _pause() {
    player.pause();
  }

  void _resume() {
    player.resume();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String strDigits1(int n) => n.toString().padLeft(2, '0');
    minus = int.parse(strDigits1(duration.inMinutes.remainder(60)));
    second = int.parse(strDigits1(duration.inSeconds.remainder(60)));

    return BlocConsumer<ChoAnBloc, ChoAnState>(
      listener: (context, state) {
        if (state is LoadingFailureState) {
          showErrorDialog(
              context, 'Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng');
        }
      },
      builder: (context, state) {
        if (state is BuMeHistoryState) {
          return ChoAnHistory(
            maCon: widget.con.id,
            choAn: state.choAn,
            chartDataChoAn: state.chartDataChoAn,
            choAnEnum: ChoAnEnum.bume,
          );
        } else if (state is LoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: getShimmer(ChoAnShimmer()),
          );
        }
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: Container(
            height: 1200,
            margin: EdgeInsets.only(
              top: size.height * 0.03,
              left: 25,
              right: 25,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 480,
                  width: size.width,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataNhapDuLieu[0].title,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: grey700,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                dataNhapDuLieu[0].descripble,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Image.asset(
                              isPlay
                                  ? 'assets/images/volume.png'
                                  : 'assets/images/mute.png',
                              scale: 5,
                              color: rose400,
                            ),
                            onPressed: () {
                              if (isPlay) {
                                _pause();
                                isPlay = !isPlay;
                              } else {
                                _resume();
                                isPlay = !isPlay;
                              }
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Milk(
                        con: widget.con,
                        stopMilkController: _stopMilkController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        rose400,
                        rose600,
                      ],
                    ),
                  ),
                  child: IconButton(
                    icon: Text(
                      'Hoàn tất',
                      style: TextStyle(
                        color: rose25,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      if (widget.count >= 10) {
                        showErrorDialog(context,
                            'Bạn đã nhập đủ 10 lần của ngày hôm nay. Vui lòng nhập tiếp vào ngày hôm sau',
                            title: 'Cảnh báo');
                      } else {
                        int totalMilk = dataBuMe[1].ml + dataBuMe[0].ml;
                        if (totalMilk != 0) {
                          dataBuMe[0].isPlaying = false;
                          dataBuMe[1].isPlaying = false;
                          _stopMilkController.text = getRandomString(5);
                          sound[0].player.stop();
                          sound[0].player.setVolume(0);
                          LoadingLogo().show(context: context);
                          DateTime thoiGian = checkTimeChange
                              ? DateTime(
                                  dateMilk.year,
                                  dateMilk.month,
                                  dateMilk.day,
                                  timeMilk.hour,
                                  timeMilk.minute,
                                  DateTime.now().second,
                                )
                              : DateTime(
                                  dateMilk.year,
                                  dateMilk.month,
                                  dateMilk.day,
                                  DateTime.now().hour,
                                  DateTime.now().minute,
                                  DateTime.now().second,
                                );
                          bool? check = await _milkRepository.insertChoAn(
                            choAn: ChoAn(
                              maLoaiChoAn: getMaChoAn(widget.type),
                              maCon: widget.con.id,
                              trongLuong: totalMilk,
                              lanChoAn: widget.count + 1,
                              thoiGian: thoiGian,
                              vuTrai: dataBuMe[1].ml,
                              vuPhai: dataBuMe[0].ml,
                            ),
                          );
                          LoadingLogo().hide();
                          if (check == true) {
                            checkTimeChange = true;
                            timeMilk = TimeOfDay(
                                hour: DateTime.now().hour,
                                minute: DateTime.now().minute);
                            dateMilk = DateTime.now();
                            Navigator.pop(context);
                            context.read<MilkBloc>().add(CheckChoAnEvent(
                                maCon: widget.con.id, date: DateTime.now()));
                            showToast(
                              context,
                              'Lượng sữa của bé đã được thêm thành công',
                              seconds: 3,
                            );
                          } else if (check == false) {
                            showErrorDialog(context,
                                'Thêm không thành công. Vui lòng kiểm tra lại kết nối mạng');
                          } else if (check == null) {
                            showErrorDialog(context,
                                'Thêm không thành công. Ngày bạn thêm đã vượt quá 10 lần');
                          }
                        } else {
                          showToast(context,
                              'Lượng sữa hiện tại đang là 0ml. Vui lòng thêm lượng sữa');
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<int> listChartHangNgay = [0, 0, 0, 0, 0, 0, 0];
