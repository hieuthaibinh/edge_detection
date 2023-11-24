// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3_disconnect.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/nav_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/choan_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ChoAnScreen extends StatefulWidget {
  final Con con;
  ChoAnScreen({
    Key? key,
    required this.con,
  }) : super(key: key);

  @override
  State<ChoAnScreen> createState() => _ChoAnScreenState();
}

class _ChoAnScreenState extends State<ChoAnScreen> {
  @override
  void initState() {
    context
        .read<MilkBloc>()
        .add(CheckChoAnEvent(maCon: widget.con.id, date: DateTime.now()));
    super.initState();
  }

  int value = 0;
  int mlBuMe = dataBuMe[0].ml + dataBuMe[1].ml;
  TextEditingController a = TextEditingController();
  List<List<int>> indexWidgets = [
    [0, 0],
    [1, 1],
    [1, 2],
    [3, 3],
  ];

  String dropdownvalue = 'Tổng quan  ';
  var items = [
    'Tổng quan  ',
    'Bú mẹ  ',
    'Bú bình  ',
    'Ăn dặm  ',
  ];

  void _callBackBloc() {
    context
        .read<MilkBloc>()
        .add(CheckChoAnEvent(maCon: widget.con.id, date: DateTime.now()));
  }

  String _buildTime(DateTime date) {
    return '${date.hour}:${date.minute}';
  }

  String _buildTooltip(ChartDataChoAn chartDataChoAn) {
    if (chartDataChoAn.maLoaiChoAn == 1) {
      int minutes = chartDataChoAn.y.toInt() * 10;
      int m = (minutes / 60).round();
      return '$m phút';
    }

    return chartDataChoAn.y.toString() + chartDataChoAn.donVi!;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MilkBloc, MilkState>(
      builder: (context, state) {
        if (state is ChoAnState) {
          List<ChoAn> listChoAn = state.listChoAn;
          List<num> listTrongLuong = [0, 0, 0, 0];
          List<ChartDataChoAn> listDataChoAn = [];
          for (int i = 0; i < listChoAn.length; i++) {
            listDataChoAn.add(
              ChartDataChoAn(
                (i + 1).toString(),
                listChoAn[i].trongLuong,
                getColorChoAn(listChoAn[i].maLoaiChoAn),
                date: listChoAn[i].thoiGian!,
                donVi: listChoAn[i].donVi,
                maLoaiChoAn: listChoAn[i].maLoaiChoAn,
              ),
            );
            listTrongLuong[listChoAn[i].maLoaiChoAn - 1] +=
                listChoAn[i].trongLuong;
          }
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(1)),
            child: Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              height: size.height,
              width: size.width,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 230,
                    width: size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleText(
                                    text: 'Hôm nay',
                                    fontWeight: FontWeight.w600,
                                    size: 12,
                                    color: grey700,
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${listChoAn.length} lần cho ăn',
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
                              TitleText(
                                text: 'Tổng quan',
                                fontWeight: FontWeight.w500,
                                size: 10,
                                color: grey400,
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
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                              builder: (data, point, series, pointIndex,
                                  seriesIndex) {
                                return Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      TitleText(
                                        text: _buildTooltip(
                                            listDataChoAn[pointIndex]),
                                        fontWeight: FontWeight.w700,
                                        size: 12,
                                        color: whiteColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Divider(
                                          height: 6,
                                          color: whiteColor,
                                        ),
                                      ),
                                      TitleText(
                                        text: _buildTime(
                                            listDataChoAn[pointIndex].date!),
                                        fontWeight: FontWeight.w700,
                                        size: 12,
                                        color: whiteColor,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            plotAreaBorderWidth: 0,
                            primaryXAxis: CategoryAxis(
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              minorTickLines: MinorTickLines(width: 0, size: 0),
                              minorGridLines: MinorGridLines(
                                  width: 0, color: Colors.transparent),
                              majorGridLines: MajorGridLines(width: 0),
                              axisLabelFormatter:
                                  (AxisLabelRenderDetails args) {
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
                                dataSource: listDataChoAn,
                                xValueMapper: (ChartDataChoAn data, _) =>
                                    data.x,
                                yValueMapper: (ChartDataChoAn data, _) =>
                                    data.y,
                                pointColorMapper: (ChartDataChoAn data, _) =>
                                    data.color,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                      left: 25,
                    ),
                    child: Text(
                      'Nhập dữ liệu',
                      style: TextStyle(
                        color: grey700,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    height: 400,
                    width: size.width,
                    color: Colors.transparent,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return TextButton(
                          style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Container(
                            height: 75,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: size.width * 0.05,
                                  decoration: BoxDecoration(
                                    color: dataChoAn[index].color,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: size.width * 0.69,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dataChoAn[index].title,
                                        style: TextStyle(
                                          color: grey700,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        dataChoAn[index].descripble +
                                            'Khoảng ' +
                                            listTrongLuong[index].toString() +
                                            dataChoAn[index].unit +
                                            dataChoAn[index].type,
                                        style: TextStyle(
                                          color: grey400,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/buttons/add.png',
                                  scale: 4,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            value = index;
                            Navigator.pushNamed(
                              context,
                              NavScreen.routeName,
                              arguments: {
                                'widgetId': indexWidgets[index][0],
                                'clickId': indexWidgets[index][1],
                                'count': listChoAn.length,
                                'con': widget.con,
                              },
                            );
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is LoadingFailureState) {
          return Home3DisconnectScreen(callback: _callBackBloc);
        }
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: getShimmer(ChoAnShimmer()),
        );
      },
    );
  }
}

class ChartDataChoAn {
  String x;
  num y;
  DateTime? date;
  Color color;
  String? donVi;
  int? maLoaiChoAn;
  ChartDataChoAn(
    this.x,
    this.y,
    this.color, {
    this.date,
    this.donVi,
    this.maLoaiChoAn,
  });
}
