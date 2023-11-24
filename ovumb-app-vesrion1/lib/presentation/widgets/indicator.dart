import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';


// indicator của chân trang question
Widget buildIndicator(bool isActive, Size size) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.bounceInOut,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    width: isActive ? size.width * 1 / 15 : size.width * 1 / 30,
    decoration: BoxDecoration(
      color: isActive ? rose400 : grey300,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
  );
}
