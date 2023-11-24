// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/color.dart';
import '../../widgets/title_text.dart';
import 'chart_screen.dart';

// màn hỉnh hiển thị biểu đồ ngang
// ignore: must_be_immutable
class ChartLandscapeScreen extends StatefulWidget {
  static const routeName = 'chart-screen-landscape';
  List<ChartData> chartData;
  ChartLandscapeScreen({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  State<ChartLandscapeScreen> createState() => _ChartLandscapeScreenState();
}

class _ChartLandscapeScreenState extends State<ChartLandscapeScreen> {
  @override
  void initState() {
    _setLandscapeOrientation();
    super.initState();
  }

  @override
  void dispose() {
    _setPortraitOrientation();
    super.dispose();
  }

  String _buildLH(int lh) {
    if (lh < 35) {
      return 'THẤP';
    } else if (lh <= 45) {
      return 'CAO';
    }
    return 'ĐẠT ĐỈNH';
  }

  String _buildTime(DateTime time) {
    return '${time.hour}:${time.minute}';
  }

  Color _buildDot(int lh) {
    if (lh < 35) {
      return violet100;
    } else if (lh <= 45) {
      return violet200;
    }
    return violet300;
  }

  // String _parseDate(DateTime time) {
  //   return '${time.day}/${time.month}';
  // }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartDataReverse = widget.chartData.reversed.toList();
    final size = MediaQuery.of(context).size;
    double heightChart = size.height * 0.8;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Biểu đồ',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: rose500,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/icons/x_icon.png',
              color: rose500,
            ),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: heightChart,
              width: size.width,
              decoration: BoxDecoration(
                color: violet50,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: TitleText(
                      text: 'Biểu đồ tăng sinh nồng độ LH',
                      fontWeight: FontWeight.w700,
                      size: 14,
                      color: grey700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        left: 40,
                        child: SizedBox(
                          height: heightChart,
                          width: size.width,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                  ),
                                  color: violet300,
                                ),
                                height: heightChart * 0.31,
                              ),
                              Container(
                                color: violet200,
                                height: heightChart * 0.0875,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  color: violet100,
                                ),
                                height: heightChart * 0.30250,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: heightChart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: heightChart * 0.31,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'ĐẠT\nĐỈNH',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: heightChart * 0.0875,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'CAO',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: heightChart * 0.30250,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'THẤP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'Ngày',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      color: grey500,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: SizedBox(
                          height: heightChart * 0.8,
                          //width: size.width * 0.9,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
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
                                        text: _buildLH(
                                            chartDataReverse[pointIndex].y),
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
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              color: _buildDot(
                                                  chartDataReverse[pointIndex]
                                                      .y),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          TitleText(
                                            text:
                                                chartDataReverse[pointIndex].x,
                                            fontWeight: FontWeight.w600,
                                            size: 12,
                                            color: whiteColor,
                                          ),
                                          TitleText(
                                            text: ' - ',
                                            fontWeight: FontWeight.w600,
                                            size: 12,
                                            color: whiteColor,
                                          ),
                                          TitleText(
                                            text: _buildTime(
                                                chartDataReverse[pointIndex]
                                                    .time),
                                            fontWeight: FontWeight.w600,
                                            size: 12,
                                            color: whiteColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            primaryYAxis: NumericAxis(
                              isVisible: false,
                              minimum: 0,
                              maximum: 80,
                              interval: 20,
                              labelStyle: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ).copyWith(color: grey500),
                              majorGridLines: const MajorGridLines(width: 0),
                              axisLine: const AxisLine(width: 0),
                            ),
                            primaryXAxis: CategoryAxis(
                              arrangeByIndex: true,
                              autoScrollingMode: AutoScrollingMode.end,
                              autoScrollingDelta: 30,
                              majorGridLines: const MajorGridLines(width: 0),
                              axisLine: const AxisLine(width: 0),
                              labelStyle: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ).copyWith(color: grey500),
                            ),
                            series: <CartesianSeries>[
                              LineSeries<ChartData, String>(
                                dataSource: chartDataReverse,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Renders the marker
                                markerSettings: const MarkerSettings(
                                  isVisible: true,
                                  borderColor: violet600,
                                  height: 8,
                                  width: 8,
                                ),
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: false,
                                  labelAlignment: ChartDataLabelAlignment.top,
                                  textStyle: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ).copyWith(color: violet600),
                                ),
                                dashArray: [5, 5],
                                color: violet600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Chuyển sang chế độ xoay ngang
void _setLandscapeOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

// Trở lại chế độ màn hình bình thường
void _setPortraitOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
