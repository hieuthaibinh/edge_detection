// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/constant/bmi_baby.dart';
import 'package:flutter_ovumb_app_version1/data/model_phattrien.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/bieudotongquat.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien_chart.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien_drag.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/phattrien_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class PhatTrienInput extends StatefulWidget {
  TextEditingController controller;
  TextEditingController bmiController;
  final Con con;
  final List<PhatTrienCon> phatTrienCon;

  PhatTrienInput({
    Key? key,
    required this.controller,
    required this.bmiController,
    required this.con,
    required this.phatTrienCon,
  }) : super(key: key);

  @override
  State<PhatTrienInput> createState() => _PhatTrienInputState();
}

class _PhatTrienInputState extends State<PhatTrienInput> {
  MilkRepository _milkRepository = MilkRepository();
  ScrollController _scrollController = ScrollController();
  TextEditingController _listenController = TextEditingController();
  TextEditingController _dateController =
      TextEditingController(text: DateTime.now().toString());
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  bool isSave = false;
  bool showHistory = false;
  final StreamController<bool> _swapButtonStream = StreamController.broadcast();
  List<List<String>> titles = [
    ['Nhập dữ liệu', 'Lịch sử phát triển'],
    ['Lịch sử phát triển', 'Hiện tại'],
  ];

  @override
  void initState() {
    _weightController = TextEditingController(text: '11');
    _heightController = TextEditingController(text: '100');
    _listenController.addListener(() {
      _callbackAPI();
    });
    _callbackAPI();
    super.initState();
  }

  void _callbackAPI() {
    _milkRepository.getPhatTrien(maCon: widget.con.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: StreamBuilder<List<PhatTrienCon>>(
          stream: _milkRepository.allListPhatTrien(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ChartData> _weightChartData = [];
              List<ChartData> _heightChartData = [];
              if (snapshot.data!.isNotEmpty) {
                _weightController = TextEditingController(
                    text: snapshot.data!.first.canNang != null
                        ? snapshot.data!.first.canNang.toString()
                        : '');
                _heightController = TextEditingController(
                    text: snapshot.data!.first.chieuCao != null
                        ? snapshot.data!.first.chieuCao.toString()
                        : '');
                int index = snapshot.data!.length;
                for (int i = 0; i < snapshot.data!.length; i++) {
                  _weightChartData.add(ChartData(
                      index.toString(),
                      snapshot.data![i].canNang ?? 0,
                      snapshot.data![i].thoiGian));
                  _heightChartData.add(ChartData(
                      index.toString(),
                      snapshot.data![i].chieuCao ?? 0,
                      snapshot.data![i].thoiGian));
                  index--;
                }

                widget.bmiController.text = BMIBaby.calculateBMI(
                        snapshot.data!.first.canNang!,
                        snapshot.data!.first.chieuCao!)
                    .toString();
              }

              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: 250,
                    width: size.width,
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PhatTrienChart(
                            title: 'Cân nặng',
                            color: rose400,
                            chartData: _weightChartData.reversed.toList(),
                            maxValue: 20,
                            dateController: _dateController,
                            con: widget.con,
                            donVi: 'kg',
                          ),
                          const SizedBox(width: 30),
                          PhatTrienChart(
                            title: 'Chiều cao',
                            color: violet400,
                            chartData: _heightChartData.reversed.toList(),
                            maxValue: 150,
                            dateController: _dateController,
                            con: widget.con,
                            donVi: 'cm',
                          ),
                        ],
                      ),
                    ),
                  ),
                  /////
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(
                          text: titles[showHistory ? 1 : 0][0],
                          fontWeight: FontWeight.w600,
                          size: 16,
                          color: grey700,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showHistory = !showHistory;
                            });
                          },
                          child: TitleText(
                            text: titles[showHistory ? 1 : 0][1],
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: rose400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: _swapButtonStream.stream,
                      builder: (context, snap) {
                        return SizedBox(
                          child: showHistory
                              ? BieuDoTongQuat(
                                  phatTrienCon: snapshot.data!,
                                  bmiController: widget.bmiController,
                                  listenController: _listenController,
                                  maCon: widget.con.id,
                                )
                              : Container(
                                  height: 400,
                                  child: Column(
                                    children: [
                                      PhattrienDrag(
                                        dataPhatTrien: dataPhatTrien[0],
                                        activeColor: rose600,
                                        normalColor: rose400,
                                        controller: _weightController,
                                        swapButtonStream: _swapButtonStream,
                                      ),
                                      PhattrienDrag(
                                        dataPhatTrien: dataPhatTrien[1],
                                        activeColor: violet600,
                                        normalColor: violet400,
                                        controller: _heightController,
                                        swapButtonStream: _swapButtonStream,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 25, top: 40),
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              rose400,
                                              rose600,
                                            ],
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: size.width,
                                          child: ElevatedButton(
                                            style: const ButtonStyle(
                                              overlayColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              shadowColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                            ),
                                            child: Text(
                                              snap.hasData
                                                  ? 'Xác nhận'
                                                  : 'Kiểm tra thể trạng',
                                              style: TextStyle(
                                                color: rose25,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            onPressed: () async {
                                              num? _weight = num.tryParse(
                                                  _weightController.text
                                                      .trim());
                                              num? _height = num.tryParse(
                                                  _heightController.text
                                                      .trim());
                                              if (snap.hasData) {
                                                LoadingLogo()
                                                    .show(context: context);

                                                bool check =
                                                    await _milkRepository
                                                        .insertPhatTrien(
                                                  phatTrienCon: PhatTrienCon(
                                                    maCon: widget.con.id,
                                                    canNang: _weight,
                                                    chieuCao: _height,
                                                    thoiGian: DateTime.parse(
                                                        _dateController.text),
                                                  ),
                                                );

                                                LoadingLogo().hide();
                                                if (check) {
                                                  widget.bmiController.text =
                                                      BMIBaby.calculateBMI(
                                                              _weight!,
                                                              _height!)
                                                          .toString();
                                                  widget.controller.text = '1';
                                                  showToast(context,
                                                      'Cập nhật thông tin thành công');
                                                } else {
                                                  showToast(context,
                                                      'Cập nhật thông tin không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                                }
                                              } else {
                                                widget.controller.text = '1';
                                                //Navigator.pushNamed(context, PhatTrienChiTiet.routeName);
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      }),
                ],
              );
            }
            return getShimmer(PhatTrienShimmer());
          },
        ),
      ),
    );
  }
}
