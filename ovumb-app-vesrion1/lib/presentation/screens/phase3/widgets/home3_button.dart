import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class Home3Button extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const Home3Button({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          scale: 2.5,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: grey700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: grey400,
          ),
        ),
      ],
    );
  }
}
