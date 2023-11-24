import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_loi_khuyen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoiKhuyen extends StatefulWidget {
  const LoiKhuyen({super.key});

  @override
  State<LoiKhuyen> createState() => _LoiKhuyenState();
}

class _LoiKhuyenState extends State<LoiKhuyen> {
  int i = 100;
  int random = 0;

  @override
  void initState() {
    random = Random().nextInt(dataLoiKhuyen[dataLoiKhuyen.length - 1].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
      //color: Colors.amber,
      height: size.height * 0.4,
      width: size.width,
      child: ListView(
        key: PageStorageKey<String>('page'),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: size.height * 0.02),
          Text(
            dataLoiKhuyen[random].title,
            style: TextStyle(
              color: grey700,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(color: rose100),
          Text(
            dataLoiKhuyen[random].loikhuyen,
            textAlign: TextAlign.justify,
            style: TextStyle(
              height: 1.5,
              color: grey700,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
