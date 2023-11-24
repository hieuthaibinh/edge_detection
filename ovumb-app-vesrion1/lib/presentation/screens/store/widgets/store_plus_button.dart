
import 'package:flutter/material.dart';

class StorePlusButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconColor;
  const StorePlusButton({
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 13,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: iconColor,
            ),
          ),
          Container(
            width: 2,
            height: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
