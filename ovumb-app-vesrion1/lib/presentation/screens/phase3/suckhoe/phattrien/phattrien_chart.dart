// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// ignore: must_be_immutable
class PhatTrienChart extends StatefulWidget {
  final List<ChartData> chartData;
  final String title;
  final Color color;
  final double maxValue;
  final Con con;
  final String donVi;
  TextEditingController dateController;
  PhatTrienChart({
    Key? key,
    required this.chartData,
    required this.title,
    required this.color,
    required this.maxValue,
    required this.con,
    required this.donVi,
    required this.dateController,
  }) : super(key: key);

  @override
  State<PhatTrienChart> createState() => _PhatTrienChartState();
}

class _PhatTrienChartState extends State<PhatTrienChart> {
  String _buildTime(String text) {
    DateTime date = DateTime.parse(text);
    if (checkTheSameDay(date, DateTime.now())) {
      return 'Hôm nay';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  String _buildToltip(DateTime date) {
    return '${date.month}/${date.year}';
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
      initialDate: DateTime.parse(widget.dateController.text),
      firstDate: widget.con.ngaySinh,
      lastDate: DateTime.now(),
    );
    if (picker != null) {
      DateTime date =
          DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(picker));
      return date;
    }
    return null;
  }

  @override
  void initState() {
    widget.dateController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 250,
        width: size.width * 0.87,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: widget.title,
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: grey700,
                          ),
                          TitleText(
                            text: 'Hằng tháng',
                            fontWeight: FontWeight.w400,
                            size: 12,
                            color: grey400,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? date = await _selectedDateTime(context);
                          if (date != null) {
                            widget.dateController.text = date.toString();
                          }
                        },
                        child: Row(
                          children: [
                            TitleText(
                              text: _buildTime(widget.dateController.text),
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: rose400,
                            ),
                            const SizedBox(width: 6),
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
                              child: Image.asset(
                                'assets/images/lich123.png',
                                scale: 2.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 170,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SfCartesianChart(
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  builder: (data, point, series, pointIndex, seriesIndex) {
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
                            text: widget.chartData[pointIndex].y.toString() +
                                widget.donVi,
                            fontWeight: FontWeight.w700,
                            size: 12,
                            color: whiteColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Divider(
                              height: 6,
                              color: whiteColor,
                            ),
                          ),
                          TitleText(
                            text: _buildToltip(
                                widget.chartData[pointIndex].date!),
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
                  arrangeByIndex: true,
                  interval: 2,
                  axisLine: AxisLine(width: 0),
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  minorTickLines: MinorTickLines(width: 0, size: 0),
                  minorGridLines:
                      MinorGridLines(width: 0, color: Colors.transparent),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: widget.maxValue,
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  majorGridLines: MajorGridLines(width: 0),
                  minorTickLines: MinorTickLines(width: 0, size: 0),
                ),
                series: <ChartSeries<ChartData, String>>[
                  ColumnSeries<ChartData, String>(
                    width: 0.05,
                    borderRadius: BorderRadius.circular(4),
                    color: widget.color,
                    dataSource: widget.chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
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
