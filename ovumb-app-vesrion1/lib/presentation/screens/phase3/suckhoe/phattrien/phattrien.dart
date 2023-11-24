// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien_chitiet.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/phattrien/phattrien_input.dart';

class PhatTrien extends StatefulWidget {
  final int widgetId;
  final Con con;
  final List<PhatTrienCon> phatTrienCon;
  const PhatTrien({
    Key? key,
    required this.widgetId,
    required this.con,
    required this.phatTrienCon,
  }) : super(key: key);

  @override
  State<PhatTrien> createState() => _PhatTrienState();
}

class _PhatTrienState extends State<PhatTrien> {
  double a = 12.0;
  RegExp regExp = RegExp(r'([.]*0)(?!.*\d)');
  TextEditingController _indexController = TextEditingController();
  TextEditingController _bmiController = TextEditingController();
  int _index = 0;

  @override
  void initState() {
    _indexController.addListener(() {
      if (_indexController.text == '1') {
        setState(() {
          _index = 1;
        });
      } else {
        setState(() {
          _index = 0;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> widgets = [
      PhatTrienInput(
        con: widget.con,
        phatTrienCon: widget.phatTrienCon,
        controller: _indexController,
        bmiController: _bmiController,
      ),
      PhatTrienChiTiet(
        con: widget.con,
        controller: _indexController,
        bmiController: _bmiController,
      ),
    ];
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: 15,
        ),
        height: size.height,
        width: size.width,
        child: widgets[_index],
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.date,
  );
  final String x;
  final num y;
  final DateTime? date;
}
