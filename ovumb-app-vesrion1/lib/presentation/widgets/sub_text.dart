import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';

class SubText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const SubText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: PrimaryFont.regular(size, FontWeight.w400)
          .copyWith(color: color, height: 1.5),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
