// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StorePayMethodInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const StorePayMethodInfo({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: violet200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            image,
            scale: 3,
            color: violet500,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: title,
              fontWeight: FontWeight.w500,
              size: 12,
              color: grey400,
            ),
            TitleText(
              text: subTitle,
              fontWeight: FontWeight.w500,
              size: 14,
              color: grey700,
            ),
          ],
        ),
      ],
    );
  }
}
