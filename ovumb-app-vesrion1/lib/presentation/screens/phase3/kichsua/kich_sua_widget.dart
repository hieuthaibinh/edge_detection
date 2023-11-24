// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/choan_chart.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/kichsua/kich_sua_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudo_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudotimeline_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class KichSuaWidget extends StatefulWidget {
  final List<ChartDataChoAn> chartDataHistory;
  final List<ChartDataChoAn> chartDataByDay;
  final List<HutSua> hutSua;
  final Con con;
  const KichSuaWidget({
    Key? key,
    required this.chartDataHistory,
    required this.chartDataByDay,
    required this.hutSua,
    required this.con,
  }) : super(key: key);

  @override
  State<KichSuaWidget> createState() => _KichSuaWidgetState();
}

class _KichSuaWidgetState extends State<KichSuaWidget> {
  DateTime? date = DateTime.now();
  MilkRepository _milkRepository = MilkRepository();
  TextEditingController _listChangeController = TextEditingController();
  bool isSwapChart = false;

  String _buildTime(DateTime date) {
    // Tạo một đối tượng DateFormat với định dạng "HH:mm".
    DateFormat format = DateFormat('HH:mm');
    // Sử dụng phương thức format để chuyển đổi DateTime thành chuỗi "xx:xx".
    return format.format(date);
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

  List<TimelineDetail> _buildTimeline(HutSua hutSua) {
    List<TimelineDetail> timelines = [];
    if (hutSua.vuTrai != null && hutSua.vuTrai != 0) {
      timelines.add(TimelineDetail(text: 'Ngực trái'));
    }
    if (hutSua.vuPhai != null && hutSua.vuPhai != 0) {
      timelines.add(TimelineDetail(text: 'Ngực phải'));
    }
    return timelines;
  }

  void _callbackAPI(DateTime date) {
    _milkRepository.getHutSuaNgayTao(date: date);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
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
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
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
                                  'Đồ thị hút sữa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                isSwapChart
                                    ? Text(
                                        '${widget.chartDataHistory.length} ngày hút sữa (ml/ngày)',
                                        style: TextStyle(
                                          color: grey400,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : Text(
                                        '${widget.chartDataByDay.length} lần hút sữa (ml/lần)',
                                        style: TextStyle(
                                          color: grey400,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                  'assets/icons/swap_icon.png',
                                  scale: 2.5,
                                ),
                                onPressed: () {
                                  isSwapChart = !isSwapChart;
                                  setState(() {});
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
                    tooltipBehavior: !isSwapChart
                        ? TooltipBehavior(
                            enable: true,
                            builder:
                                (data, point, series, pointIndex, seriesIndex) {
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
                                      text: widget.chartDataByDay[pointIndex].y
                                              .toString() +
                                          'ml',
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
                                      text: _buildTime(widget
                                          .chartDataByDay[pointIndex].date!),
                                      fontWeight: FontWeight.w700,
                                      size: 12,
                                      color: whiteColor,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : null,
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      axisLine: AxisLine(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                      minorTickLines: MinorTickLines(width: 0, size: 0),
                      minorGridLines:
                          MinorGridLines(width: 0, color: Colors.transparent),
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
                      minorGridLines:
                          MinorGridLines(width: 0, color: Colors.transparent),
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
                        dataSource: isSwapChart
                            ? widget.chartDataHistory
                            : widget.chartDataByDay,
                        xValueMapper: (ChartDataChoAn data, _) => data.x,
                        yValueMapper: (ChartDataChoAn data, _) => data.y,
                        pointColorMapper: (ChartDataChoAn data, _) =>
                            data.color,
                        dataLabelMapper: (datum, index) =>
                            widget.chartDataHistory[index].y.toInt().toString(),
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
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  child: Text(
                    'Nhập dữ liệu',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: grey700,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                StreamBuilder<List<HutSua>>(
                  initialData: widget.hutSua,
                  stream: _milkRepository.allListHutSua(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<HutSua> hutSua = snapshot.data!;
                      double listHeight = hutSua.length * 100;
                      double maxHeight = 300 + listHeight;
                      return SizedBox(
                        height: maxHeight,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  KichSuaInput.routeName,
                                  arguments: {
                                    'con': widget.con,
                                    'count': hutSua.length,
                                  },
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Container(
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
                                          color: rose400,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                height: 80,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TitleText(
                                                      text: 'Hút sữa cho mẹ',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      size: 14,
                                                      color: grey700,
                                                    ),
                                                    SizedBox(height: 2),
                                                    TitleText(
                                                      text:
                                                          'Ngực trái, ngực phải',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12,
                                                      color: grey400,
                                                    ),
                                                    SizedBox(height: 2),
                                                    TitleText(
                                                      text:
                                                          'Khoảng ${ChoanChart().getTotalHutSua(hutSua) ?? 0}ml sữa',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12,
                                                      color: grey400,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 14),
                                              child: Image.asset(
                                                'assets/buttons/add.png',
                                                scale: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleText(
                                  text: 'Lịch sử hút sữa',
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
                                        ? (checkTheSameDay(
                                                date!, DateTime.now())
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
                                            number: hutSua.length,
                                            descripble: 'Lần',
                                          ),
                                          VerticalDivider(
                                              color: grey300, thickness: 1),
                                          BieuDoWidget(
                                            title: 'Tổng',
                                            number: ChoanChart()
                                                .getTotalHutSua(hutSua),
                                            descripble: 'ml',
                                          ),
                                          VerticalDivider(
                                              color: grey300, thickness: 1),
                                          BieuDoWidget(
                                            title: 'Trung bình',
                                            number: ChoanChart()
                                                .getAverageHutSua(hutSua),
                                            descripble: 'ml/lần',
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
                                itemCount: hutSua.length,
                                itemBuilder: (context, index) {
                                  HutSua hs = hutSua[index];
                                  return BieuDoTimeline(
                                    maCon: 0,
                                    choAnEnum: ChoAnEnum.hutsua,
                                    time: _buildTime(hs.thoiGian!),
                                    ml: ChoanChart().getTotalHutSua([hs]),
                                    index: index,
                                    last: hutSua.length - 1 == index,
                                    hutSua: hs,
                                    timelines: _buildTimeline(hs),
                                    date: date,
                                    listenChangeController:
                                        _listChangeController,
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
        ],
      ),
    );
  }
}
