// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/chart/chart_logic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chart_history_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/chart_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../../logic/bloc/main/main_bloc.dart';
import '../../../logic/bloc/main/main_state.dart';
import '../../utils/color.dart';
import '../../widgets/chart/chart_history_item.dart';
import '../../widgets/title_text.dart';
import 'chart_landscape_screen.dart';

// màn hỉnh hiển thị biểu đồ dọc
class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double heightChart = 380;
    final List<ChartData> chartData = [];

    String _buildTime(DateTime time) {
      return '${time.hour}:${time.minute}';
    }

    String _parseDate(DateTime time) {
      return '${time.day}/${time.month}';
    }

    // List<KetQuaTest> revered = listKQ.reversed.toList();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                'Biểu đồ',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ).copyWith(
                  color: rose500,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  ChartLandscapeScreen.routeName,
                  arguments: chartData,
                ),
                icon: Image.asset('assets/icons/rotate_chart_icon.png'),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
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
          if (state is ChartState) {
            state.ketQuaTest.forEach(
              (e) => chartData
                  .add(ChartData(_parseDate(e.thoiGian), e.ketQua, e.thoiGian)),
            );
            List<ChartData> chartDataSub = chartData;
            final List<ChartData> chartDataReverse =
                chartDataSub.reversed.toList();
            // listKQ.reversed.forEach(
            //   (e) => chartData
            //       .add(ChartData(_parseDate(e.thoiGian), e.ketQua, e.thoiGian)),
            // );
            // List<ChartData> chartDataSub = test;
            // if (chartData.length > 12) {
            //   chartDataSub = chartData.sublist(0, 12);
            // }
            //final List<ChartData> chartDataReverse = chartDataSub.toList();
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      height: heightChart,
                      decoration: BoxDecoration(
                        color: violet50,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
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
                                // top: 0,
                                // bottom: 0,
                                child: SizedBox(
                                  height: heightChart,
                                  width: size.width * 0.8,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                          ),
                                          color: violet300,
                                        ),
                                        height: heightChart * 0.2750,
                                      ),
                                      Container(
                                        color: violet200,
                                        height: heightChart * 0.175,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          color: violet100,
                                        ),
                                        height: heightChart * 0.2500,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: SizedBox(
                                  height: heightChart,
                                  width: size.width * 0.87,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: heightChart * 0.2625,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            'ĐẠT\nĐỈNH',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: heightChart * 0.175,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            'CAO',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: heightChart * 0.2625,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            'THẤP',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
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
                              SizedBox(
                                child: SfCartesianChart(
                                  plotAreaBorderWidth: 0,
                                  onZooming: (zoomingArgs) {},
                                  onTooltipRender: (tooltipArgs) {},
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          children: [
                                            TitleText(
                                              text: checkLH(
                                                  chartDataReverse[pointIndex]
                                                      .y),
                                              fontWeight: FontWeight.w700,
                                              size: 12,
                                              color: whiteColor,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                    color: buildDot(
                                                        chartDataReverse[
                                                                pointIndex]
                                                            .y),
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                TitleText(
                                                  text: chartDataReverse[
                                                          pointIndex]
                                                      .x,
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
                                                      chartDataReverse[
                                                              pointIndex]
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
                                    isVisible: true,
                                    minimum: 0,
                                    maximum: 80,
                                    interval: 80,
                                    labelStyle: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ).copyWith(color: Colors.transparent),
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    axisLine: const AxisLine(width: 0),
                                  ),
                                  primaryXAxis: CategoryAxis(
                                    isVisible: true,
                                    arrangeByIndex: true,
                                    //labelPlacement: LabelPlacement.onTicks,
                                    autoScrollingMode: AutoScrollingMode.end,
                                    //isInversed: true,
                                    autoScrollingDelta: 10,
                                    axisBorderType:
                                        AxisBorderType.withoutTopAndBottom,
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
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
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      // Renders the marker
                                      markerSettings: const MarkerSettings(
                                        isVisible: true,
                                        borderColor: violet600,
                                        height: 8,
                                        width: 8,
                                        borderWidth: 1.5,
                                      ),
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: false,
                                        labelAlignment:
                                            ChartDataLabelAlignment.top,
                                        textStyle: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ).copyWith(color: violet600),
                                      ),
                                      dashArray: [1, 3],
                                      color: violet600,
                                    ),
                                    // SplineSeries<ChartData, String>(
                                    //     dataSource: chartDataReverse,
                                    //     xValueMapper: (ChartData data, _) =>
                                    //         data.x,
                                    //     yValueMapper: (ChartData data, _) =>
                                    //         data.y)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const TitleText(
                        text: 'Lịch sử Test',
                        fontWeight: FontWeight.w700,
                        size: 18,
                        color: grey700,
                      ),
                      trailing: TextButton(
                        style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          if (state.ketQuaTest.isEmpty) {
                            showToast(context, 'Bạn chưa có kết quả Test nào');
                          } else {
                            Navigator.pushNamed(
                              context,
                              ChartHistoryScreen.routeName,
                              arguments: state.ketQuaTest,
                            );
                          }
                        },
                        child: const TitleText(
                          text: 'Xem thêm',
                          fontWeight: FontWeight.w400,
                          size: 12,
                          color: violet500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: violet500,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: TitleText(
                                  text: 'Ngày',
                                  fontWeight: FontWeight.w600,
                                  size: 14,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: TitleText(
                                text: 'Giờ',
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: grey700,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: TitleText(
                                text: 'Giá trị LH',
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: grey700,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: TitleText(
                                text: 'Lần Test',
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: grey700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: whiteColor,
                      height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.ketQuaTest.length,
                        itemBuilder: (context, index) {
                          return ChartHistoryItem(
                            ketQuaTest: state.ketQuaTest[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return getShimmer(ChartShimmer());
        },
      ),
    );
  }
}

//model dữ liệu biểu đồ trục x,y
class ChartData {
  ChartData(
    this.x,
    this.y,
    this.time,
  );
  final String x;
  final int y;
  final DateTime time;
}
