
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreMenuButton extends StatelessWidget {
  const StoreMenuButton({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xffFFF1F3),
          ),
          child: Image.asset(
            image,
            scale: 3.5,
          ),
        ),
        const SizedBox(height: 5),
        TitleText(
          text: title,
          fontWeight: FontWeight.w600,
          size: 12,
          color: grey500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
