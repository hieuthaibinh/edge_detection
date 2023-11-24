import 'package:flutter/material.dart';

import '../../utils/palette.dart';

class Skip2Widget extends StatefulWidget {
  const Skip2Widget({super.key});

  @override
  State<Skip2Widget> createState() => _Skip2WidgetState();
}

class _Skip2WidgetState extends State<Skip2Widget> {
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
              color: Palette.title,
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
