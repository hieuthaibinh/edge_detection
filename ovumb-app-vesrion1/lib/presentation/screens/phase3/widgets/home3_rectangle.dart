// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class Home3Rectangle extends StatelessWidget {
  final String title;
  final dynamic text;
  final String subText;
  const Home3Rectangle({
    Key? key,
    required this.title,
    this.text,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        margin: EdgeInsets.only(
          right: 5,
          top: 5,
          bottom: 5,
        ),
        width: size.width * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment(0.41, -0.91),
            end: Alignment(-0.41, 0.91),
            colors: [
              rose200,
              rose300,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              (text == null ? '-- ' : text.toString()) + subText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
