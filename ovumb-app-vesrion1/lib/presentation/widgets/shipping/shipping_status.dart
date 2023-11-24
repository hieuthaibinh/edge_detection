import 'package:flutter/material.dart';

class ShippingStatus extends StatelessWidget {
  final String text;
  final Color colorText;
  final Color colorBackground;
  final double width;
  ShippingStatus({
    super.key,
    required this.text,
    required this.colorText,
    required this.colorBackground,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: colorText,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
