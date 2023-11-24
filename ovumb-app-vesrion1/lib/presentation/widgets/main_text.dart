import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';

class MainText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  const MainText({
    super.key,
    required this.text,
    required this.color,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Text(
        text,
        style: PrimaryFont.bold(
          24,
          FontWeight.w700,
        ).copyWith(
          color: color,
        ),
        textAlign: align,
      ),
    );
  }
}
