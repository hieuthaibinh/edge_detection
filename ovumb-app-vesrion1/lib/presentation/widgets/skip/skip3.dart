import 'package:flutter/material.dart';

import '../../utils/palette.dart';

class Skip3Widget extends StatefulWidget {
  const Skip3Widget({super.key});

  @override
  State<Skip3Widget> createState() => _Skip3WidgetState();
}

class _Skip3WidgetState extends State<Skip3Widget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Palette.pageView,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(right: 3),
            width: size.width * 0.17,
            height: size.height * 0.005,
          ),
          Container(
            decoration: BoxDecoration(
              color: Palette.pageView,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(right: 3),
            width: size.width * 0.17,
            height: size.height * 0.005,
          ),
          Container(
            decoration: BoxDecoration(
              color: Palette.title,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(right: 3),
            width: size.width * 0.17,
            height: size.height * 0.005,
          ),
          Container(
            margin: EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              color: Palette.pageView,
              borderRadius: BorderRadius.circular(15),
            ),
            width: size.width * 0.17,
            height: size.height * 0.005,
          ),
          Container(
            decoration: BoxDecoration(
              color: Palette.pageView,
              borderRadius: BorderRadius.circular(15),
            ),
            width: size.width * 0.17,
            height: size.height * 0.005,
          ),
        ],
      ),
    );
  }
}
