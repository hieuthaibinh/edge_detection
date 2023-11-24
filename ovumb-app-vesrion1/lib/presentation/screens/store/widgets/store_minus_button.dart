
import 'package:flutter/material.dart';

class StoreMinusButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconColor;
  const StoreMinusButton({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 13,
            height: 2,
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

