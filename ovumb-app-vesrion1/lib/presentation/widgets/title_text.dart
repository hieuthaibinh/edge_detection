// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
  const TitleText({
    Key? key,
    required this.text,
    required this.fontWeight,
    required this.size,
    required this.color,
    this.textAlign,
    this.textDecoration,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
      ),
      maxLines: maxLines ?? 2,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
