import 'package:flutter/material.dart';

import '../../utils/palette.dart';

class Skip4Widget extends StatefulWidget {
  const Skip4Widget({super.key});

  @override
  State<Skip4Widget> createState() => _Skip4WidgetState();
}

class _Skip4WidgetState extends State<Skip4Widget> {
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
              color: Palette.title,
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
