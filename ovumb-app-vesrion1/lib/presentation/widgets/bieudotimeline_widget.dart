// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/history_modal_bottom.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class BieuDoTimeline extends StatefulWidget {
  int index;
  bool last;
  String time;
  int? ml;
  List<TimelineDetail> timelines;
  ChoAnEnum choAnEnum;
  ChoAn? choAn;
  HutSua? hutSua;
  int maCon;
  DateTime? date;
  TextEditingController listenChangeController;
  num? canNang;
  num? chieuCao;

  BieuDoTimeline({
    Key? key,
    required this.index,
    required this.last,
    required this.time,
    this.ml,
    required this.timelines,
    required this.choAnEnum,
    this.choAn,
    this.hutSua,
    required this.maCon,
    this.date,
    required this.listenChangeController,
    this.canNang,
    this.chieuCao,
  }) : super(key: key);

  @override
  State<BieuDoTimeline> createState() => _BieuDoTimelineState();
}

class _BieuDoTimelineState extends State<BieuDoTimeline> {
  List<String> listPhatTrien = ['Cân nặng', 'Chiều cao'];
  List<String> listBuMe = ['Ngực trái', 'Ngực phải'];
  List<String> listBuBinh = ['Sữa công thức', 'Sữa mẹ'];
  List<String> listAnDam = ['Ăn dặm'];
  late TextEditingController _controller;
  String? valueDropdown;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  TextEditingController _donViController = TextEditingController(text: 'ml');

  List<Color> _buildColor(String text) {
    switch (text.split(' ').last.toLowerCase()) {
      case 'trái':
        return [violet100, violet400];
      case 'phải':
        return [rose100, rose400];
      case 'thức':
        return [Color(0xffE8EDFF), Color(0xff4168F2)];
      case 'mẹ':
        return [Color(0xffFFF6E8), Color(0xffF7B262)];
      case 'cm':
        return [violet100, violet400];
      case 'kg':
        return [rose100, rose400];
      case 'đạm':
        return [rose100, rose400];
      case 'bột':
        return [violet100, violet400];
      case 'hạt':
        return [Color(0xffFFF6E8), Color(0xffF7B262)];
      case 'nhuyễn':
        return [Color(0xffE8EDFF), Color(0xff4168F2)];
      case 'quả':
        return [Color(0xffD8F6F8), Color(0xff2EB6BE)];
      case 'khác':
        return [grey100, grey400];
      default:
        return [rose100, rose400];
    }
  }

  Widget _buildDetails(List<TimelineDetail> timelines) {
    List<List<TimelineDetail>> res = [];
    int i = 0;
    while (i < timelines.length) {
      int endIndex = i + 2;
      if (endIndex > timelines.length) {
        endIndex = timelines.length;
      }
      List<TimelineDetail> sublist = timelines.sublist(i, endIndex);
      res.add(sublist);
      i += 2;
    }
    return Column(
      children: List.generate(
        res.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: List.generate(
              res[index].length,
              (j) => Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _buildColor(res[index][j].text)[0], // FFF6E8
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  res[index][j].text,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: _buildColor(
                        res[index][j].text)[1], // Color(0xFFF7B262),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  String _buildDonVi() {
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      if (valueDropdown == 'Cân nặng') {
        _donViController.text = 'kg';
        return 'kg';
      } else {
        _donViController.text = 'cm';
        return 'cm';
      }
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      _donViController.text = 'gam';
      return 'gam';
    } else if (widget.choAnEnum == ChoAnEnum.bume) {
      _donViController.text = 'phút';
      return 'phút';
    } else {
      _donViController.text = 'ml';
      return 'ml';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: 50,
              child: Text(
                widget.time,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: rose500, // grey500
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.index == 0
                        ? 'assets/images/circle_active.png'
                        : 'assets/images/circle_unactive.png',
                    scale: 3,
                    fit: BoxFit.contain,
                  ),
                  widget.last
                      ? const SizedBox()
                      : Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 1,
                            color: grey300,
                          ),
                        ),
                ],
              ),
            ),
          ),
          if (widget.ml != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 4),
              child: Text(
                widget.ml.toString() + _buildDonVi(),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: grey500,
                ),
              ),
            ),
          ],
          Expanded(child: _buildDetails(widget.timelines)),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white.withOpacity(0),
                barrierColor: Colors.black38,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26),
                  ),
                ),
                context: context,
                builder: (context) {
                  return HistoryModalBottom(
                    choAnEnum: widget.choAnEnum,
                    timelines: widget.timelines,
                    listenChangeController: widget.listenChangeController,
                    maCon: widget.maCon,
                    choAn: widget.choAn,
                    canNang: widget.canNang,
                    chieuCao: widget.chieuCao,
                    hutSua: widget.hutSua,
                    date: widget.date,
                    ml: widget.ml,
                  );
                },
                isScrollControlled: true,
              );
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
              child: Image.asset(
                'assets/images/pen1.png',
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineDetail {
  final String text;
  TimelineDetail({
    required this.text,
  });
}
