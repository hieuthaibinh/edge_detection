// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class BieuDoWidget extends StatelessWidget {
  String title;
  String descripble;
  num? number;
  BieuDoWidget({
    super.key,
    required this.title,
    required this.descripble,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: grey500,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              number != null ? number.toString() : '---',
              style: TextStyle(
                color: rose400,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              descripble,
              style: TextStyle(
                color: grey500,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
