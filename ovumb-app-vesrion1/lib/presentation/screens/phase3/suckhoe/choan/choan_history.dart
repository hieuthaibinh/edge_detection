// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/choan_chart.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudo_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudotimeline_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ChoAnHistory extends StatefulWidget {
  static const routeName = 'choan-history-screen';
  final int maCon;
  final List<ChartDataChoAn> chartDataChoAn;
  final List<ChoAn> choAn;
  final ChoAnEnum choAnEnum;
  const ChoAnHistory({
    Key? key,
    required this.maCon,
    required this.chartDataChoAn,
    required this.choAn,
    required this.choAnEnum,
  }) : super(key: key);

  @override
  State<ChoAnHistory> createState() => _ChoAnHistoryState();
}

class _ChoAnHistoryState extends State<ChoAnHistory> {
  double maxValue = 100;
  MilkRepository _milkRepository = MilkRepository();
  DateTime? date = DateTime.now();
  TextEditingController _listChangeController = TextEditingController();

  String _buildTime(DateTime date) {
    // Tạo một đối tượng DateFormat với định dạng "HH:mm".
    DateFormat format = DateFormat('HH:mm');

    // Sử dụng phương thức format để chuyển đổi DateTime thành chuỗi "xx:xx".
    return format.format(date);
  }

  List<TimelineDetail> _buildTimeline(ChoAn choAn) {
    if (widget.choAnEnum == ChoAnEnum.bume) {
      List<TimelineDetail> timelines = [];
      if (choAn.vuTrai != null && choAn.vuTrai != 0) {
        timelines.add(TimelineDetail(text: 'Ngực trái'));
      }
      if (choAn.vuPhai != null && choAn.vuPhai != 0) {
        timelines.add(TimelineDetail(text: 'Ngực phải'));
      }
      return timelines;
    } else if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
      return [TimelineDetail(text: choAn.tenLoaiChoAn!)];
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      List<TimelineDetail> timelines = [];
      List<String> list = choAn.loaiThucPham!.split(';');
      list.forEach((e) {
        if (e != '') {
          timelines.add(TimelineDetail(text: e));
        }
      });
      return timelines;
    }
    return [];
  }

  List<String> _buildDonVi() {
    return widget.choAnEnum == ChoAnEnum.andam
        ? ['g', 'g/lần']
        : ['ml', 'ml/lần'];
  }

  Future<DateTime?> _selectedDateTime(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      builder: (context1, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: rose400, // header background color
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: date != null ? date! : DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1000)),
      lastDate: DateTime.now().add(Duration(days: 1000)),
    );
    if (picker != null) {
      DateTime date =
          DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(picker));
      return date;
    }
    return null;
  }

  void _callbackAPI(DateTime date) {
    if (widget.choAnEnum == ChoAnEnum.bume) {
      _milkRepository.getChoAnNgayTao(
        maCon: widget.maCon,
        maLoaiChoAn: [getMaChoAn(ChoAnEnum.bume)],
        date: date,
      );
    } else if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
      _milkRepository.getChoAnNgayTao(
        maCon: widget.maCon,
        maLoaiChoAn: [
          getMaChoAn(ChoAnEnum.suacongthuc),
          getMaChoAn(ChoAnEnum.suame)
        ],
        date: date,
      );
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      _milkRepository.getChoAnNgayTao(
        maCon: widget.maCon,
        maLoaiChoAn: [getMaChoAn(ChoAnEnum.andam)],
        date: date,
      );
    }
    setState(() {});
  }

  int _parseMinutes(num value) {
    int minutes = value.toInt() * 10;
    int m = (minutes / 60).round();
    return m;
  }

  @override
  void initState() {
    _listChangeController.addListener(() {
      _callbackAPI(date!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 230,
                width: size.width,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lịch sử cho ăn',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          'Số ngày',
                                          style: TextStyle(
                                            color: grey400,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '(ml-gam)',
                                          style: TextStyle(
                                            color: grey400,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 9,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    icon: Image.asset(
                                      'assets/icons/settings.png',
                                      scale: 2.5,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<ChoAnBloc>()
                                          .add(ChoanInitialEvent());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(''),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 170,
                      color: Colors.transparent,
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 10,
                        right: 10,
                      ),
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          minorTickLines: MinorTickLines(width: 0, size: 0),
                          minorGridLines: MinorGridLines(
                              width: 0, color: Colors.transparent),
                          majorGridLines: MajorGridLines(width: 0),
                          axisLabelFormatter: (AxisLabelRenderDetails args) {
                            late String text;
                            late TextStyle textStyle;
                            text = '${args.text}';
                            textStyle = TextStyle(
                              color: grey400,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            );
                            return ChartAxisLabel(text, textStyle);
                          },
                          arrangeByIndex: false,
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          opposedPosition: false,
                          majorGridLines: MajorGridLines(width: 0),
                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          minorTickLines: MinorTickLines(width: 0, size: 0),
                          minorGridLines: MinorGridLines(
                              width: 0, color: Colors.transparent),
                        ),
                        axes: [
                          NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            name: 'yAxis',
                            opposedPosition: true,
                          )
                        ],
                        series: <ChartSeries<ChartDataChoAn, String>>[
                          ColumnSeries<ChartDataChoAn, String>(
                            width: 0.1,
                            borderRadius: BorderRadius.circular(4),
                            dataSource: widget.chartDataChoAn,
                            xValueMapper: (ChartDataChoAn data, _) => data.x,
                            yValueMapper: (ChartDataChoAn data, _) => data.y,
                            pointColorMapper: (ChartDataChoAn data, _) =>
                                data.color,
                            dataLabelMapper: (datum, index) =>
                                widget.chartDataChoAn[index].y.toString(),
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(
                                fontSize: 8,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: grey700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    text: 'Lịch sử cho ăn',
                    fontWeight: FontWeight.w600,
                    size: 16,
                    color: grey700,
                  ),
                  InkWell(
                    onTap: () async {
                      date = await _selectedDateTime(context);
                      if (date != null) {
                        _callbackAPI(date!);
                      }
                    },
                    child: TitleText(
                      text: date != null
                          ? (checkTheSameDay(date!, DateTime.now())
                              ? 'Hôm nay'
                              : convertDateTime(date!))
                          : 'Hôm nay',
                      fontWeight: FontWeight.w500,
                      size: 14,
                      color: rose400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              StreamBuilder<List<ChoAn>>(
                initialData: widget.choAn,
                stream: _milkRepository.allListChoAn(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChoAn> choAn = snapshot.data!;
                    double listHeight = choAn.length * 100;
                    double maxHeight = 200 + listHeight;
                    return SizedBox(
                      height: maxHeight,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            height: 110,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  width: size.width,
                                  height: 90,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        BieuDoWidget(
                                          title: 'Số lần',
                                          number: choAn.length,
                                          descripble: 'lần',
                                        ),
                                        VerticalDivider(
                                            color: grey300, thickness: 1),
                                        BieuDoWidget(
                                          title: 'Tổng',
                                          number: ChoanChart().getTotal(
                                              choAn, widget.choAnEnum),
                                          descripble: _buildDonVi()[0],
                                        ),
                                        VerticalDivider(
                                            color: grey300, thickness: 1),
                                        BieuDoWidget(
                                          title: 'Trung bình',
                                          number: ChoanChart().getAverage(
                                              choAn, widget.choAnEnum),
                                          descripble: _buildDonVi()[1],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: listHeight,
                            width: size.width,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: choAn.length,
                              itemBuilder: (context, index) {
                                ChoAn ca = choAn[index];
                                return BieuDoTimeline(
                                  maCon: widget.maCon,
                                  choAnEnum: widget.choAnEnum,
                                  time: _buildTime(ca.thoiGian!),
                                  ml: ca.maLoaiChoAn == 1
                                      ? _parseMinutes(ca.trongLuong)
                                      : ca.trongLuong.toInt(),
                                  choAn: ca,
                                  index: index,
                                  last: choAn.length - 1 == index,
                                  timelines: _buildTimeline(ca),
                                  date: date,
                                  listenChangeController: _listChangeController,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
